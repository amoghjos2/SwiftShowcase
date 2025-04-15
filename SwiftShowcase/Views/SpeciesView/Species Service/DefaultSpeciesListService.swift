//
//  DefaultSpeciesListService.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

struct DefaultSpeciesListService: SpeciesListService {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService = DefaultNetworkService()) {
        self.networkService = networkService
    }
    
    func speciesList(for page: Int) async throws -> [Specie] {

        let data: Data = try await networkService.request(at: SpeciesListEndPoint(page: String(page)))
        
        var species = [Specie]()
        for detail in data.data {
            let specie = Specie(id: detail.id,
                                name: detail.common_name,
                                imageURL: detail.default_image?.thumbnail)
            
            species.append(specie)
        }
        
        return species
    }
}

struct Data: Decodable {
    let data: [SpecieDetail]
}

struct SpecieDetail: Decodable {
    let id: Int
    let common_name: String
    let default_image: DefaultImage?
}

struct DefaultImage: Decodable {
    let thumbnail: String
}
