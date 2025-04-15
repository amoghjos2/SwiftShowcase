//
//  DefaultSpeciesListService.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

struct DefaultSpeciesListService: SpeciesListService {
    
    private let networkService: NetworkService
    
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
    
    private struct SpeciesListEndPoint: SpeciesEndPoint {
        
        let page: String
        
        var path: String {
            return "/api/species-list"
        }
        
        var queryItems: [URLQueryItem]? {
            return baseQueryItems + [URLQueryItem(name: "page", value: page)]
        }
    }
    
    private struct Data: Decodable {
        let data: [SpecieDetail]
    }

    private struct SpecieDetail: Decodable {
        let id: Int
        let common_name: String
        let default_image: DefaultImage?
    }

    private struct DefaultImage: Decodable {
        let thumbnail: String
    }

}
