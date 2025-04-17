//
//  DefaultSpecieDetailFactory.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

struct DefaultSpecieDetailFactory: SpecieDetailFactoryProtocol {
    func specieDetailService(for specieId: Int,
                             with networkService: NetworkService = DefaultNetworkService()) -> SpecieDetailServiceProtocol {
        return DefaultSpecieDetailService(networkService: networkService)
    }
}
