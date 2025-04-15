//
//  SpeciesEndPoint.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

protocol SpeciesEndPoint: EndPoint { }

extension EndPoint where Self: SpeciesEndPoint {
    var scheme: String { "https" }
    
    var host: String { "perenual.com" }
    
    var baseQueryItems: [URLQueryItem] {
        #warning("Store API key more securly")
        return [URLQueryItem(name: "key", value: "sk-sENu67fd8330d24c99789")]
    }
}
