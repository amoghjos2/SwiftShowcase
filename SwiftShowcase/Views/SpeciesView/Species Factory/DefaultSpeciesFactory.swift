//
//  DefaultSpeciesFactory.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

struct DefaultSpeciesFactory: SpeciesFactoryProtocol {
    func specisesMainView(with factory: SpeciesFactoryProtocol = DefaultSpeciesFactory()) -> SpeciesMainView {
        SpeciesMainView(factory: factory)
    }
    
    func speciesMainViewModel(with speciesService: SpeciesService? = nil) -> SpeciesMainViewModel {
        let speciesService = speciesService ?? self.speciesService()
        return SpeciesMainViewModel(with: speciesService)
    }
    
    func speciesService(with networkService: NetworkService = DefaultNetworkService()) -> SpeciesService {
        return DefaultSpeciesService(networkService: networkService)
    }
}
