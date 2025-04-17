//
//  SpecieDetail.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

struct SpecieDetail: Decodable {
    let name: String
    let type: String
    let dimension: String
    let cycle: String
    let watering: String
    
    enum CodingKeys: String, CodingKey {
        case name = "common_name"
        case type
        case dimension
        case cycle
        case watering
    }
}

let demoSpecieDetail = SpecieDetail(name: "Candicans White Fir",
                                    type: "tree",
                                    dimension: "Height:  30 feet",
                                    cycle: "Perennial",
                                    watering: "Average")
