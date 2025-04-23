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
    
    static func speciesMainView(viewModel: SpeciesMainViewModel = speciesMainViewModel()) -> SpeciesMainView {
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
    
    #warning("chatGPT mentions that this is a bad practice as SwiftUI might create multiple instances of view model. The suggested approach seems like to create view model seperately and then pass it down")
    
    static func specieDetailView(for specieID: Int) -> SpecieDetailView {
        let vm = specieDetailViewModel(for: specieID)
        return SpecieDetailView(viewModel: vm)
    }
}
