//
//  ViewController.swift
//  post
//
//  Created by Pratibha on 29/01/18.
//  Copyright © 2018 pratik. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
   
    @IBOutlet weak var tableview: UITableView!
    var heroes = [HeroStats]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       downloadJSON {
            self.tableview.reloadData()
        }
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        cell.textLabel?.text = heroes[indexPath.row].attack_type.capitalized
//        return cell
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! TableViewCell
            cell.label.text = heroes[indexPath.row].attack_type.capitalized
            
            cell.lable2.text = heroes[indexPath.row].name.capitalized
            return cell
    }
    

    func downloadJSON(completed: @escaping () -> ()) {
        
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
            
                do {
                    self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch {
                    print("JSON Error")
                }
            }
            }.resume()
    }
}




