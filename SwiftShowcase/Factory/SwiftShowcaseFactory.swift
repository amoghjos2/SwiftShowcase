//
//  Factory.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/21/25.
//

import Foundation

struct SwiftShowcaseFactory {
    
    static func networkClient(with session: URLSession = .shared) -> NetworkClient {
        let model = SpeciesMainViewModel(with: DefaultSpeciesService(networkService: DefaultNetworkClient(session: .shared)))
        return DefaultNetworkClient(session: session)
    }
}
