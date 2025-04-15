//
//  SpeciesEndPoint.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

struct SpeciesListEndPoint: SpeciesEndPoint {
    
    let page: String
    
    var path: String {
        return "/api/species-list"
    }
    
    var queryItems: [URLQueryItem]? {
        return baseQueryItems + [URLQueryItem(name: "page", value: page)]
    }
}
