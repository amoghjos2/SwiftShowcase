//
//  DefaultSpecieDetailFactory.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

struct DefaultSpecieDetailFactory: SpecieDetailFactory {
    
    func specieDetailService(with networkService: NetworkService = DefaultNetworkService()) -> SpecieDetailService {
        return DefaultSpecieDetailService(networkService: networkService)
    }
    
    func specieDetailViewModel(for specieID: Int, with specieDetailService: SpecieDetailService?) -> SpecieDetailViewModel {
        let specieDetailService = specieDetailService ?? self.specieDetailService()
        
        return SpecieDetailViewModel(specieID: specieID,
                                     specieDetailService: specieDetailService)
    }
}
