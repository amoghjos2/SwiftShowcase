//
//  Factory.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/21/25.
//

import Foundation

struct SwiftShowcaseFactory {
    
    static func networkClient(session: URLSession = .shared) -> NetworkClient {
        return DefaultNetworkClient(session: session)
    }
    
    //MARK: Species Main View
    static func speciesService(networkClient: NetworkClient = networkClient()) -> SpeciesService {
        return DefaultSpeciesService(networkService: networkClient)
    }
    
    static func speciesMainViewModel(speciesService: SpeciesService = speciesService()) -> SpeciesMainViewModel {
        return SpeciesMainViewModel(speciesService: speciesService)
    }
    
    static func speciesMainView(viewModel: SpeciesMainViewModel) -> SpeciesMainView {
        return SpeciesMainView(viewModel: viewModel)
    }
    
    //MARK: Species Detail View
    static func specieDetailService(networkClient: NetworkClient = networkClient()) -> SpecieDetailService {
        return DefaultSpecieDetailService(networkService: networkClient)
    }
    
    static func specieDetailViewModel(for specieID: Int,
                                      specieDetailService: SpecieDetailService = specieDetailService()) -> SpecieDetailViewModel {
        return SpecieDetailViewModel(specieID: specieID, specieDetailService: specieDetailService)
    }
        
    static func specieDetailView(viewModel: SpecieDetailViewModel) -> SpecieDetailView {
        return SpecieDetailView(viewModel: viewModel)
    }
}
