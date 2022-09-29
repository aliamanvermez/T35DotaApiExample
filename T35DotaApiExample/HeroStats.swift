//
//  HeroStats.swift
//  T35DotaApiExample
//
//  Created by NeonApps on 23.09.2022.
//

import Foundation
struct HeroStats: Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
    let icon: String
}
