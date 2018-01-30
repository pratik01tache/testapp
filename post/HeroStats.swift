//
//  HeroStats.swift
//  ApiDataWithImages
//
//  Created by Yash Patel on 16/11/17.
//  Copyright © 2017 Yash Patel. All rights reserved.
//

import Foundation

struct HeroStats:Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let x:String
    let img: String
    let name: String
}

