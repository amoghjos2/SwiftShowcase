//
//  DefaultSpeciesListService.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

struct DefaultSpeciesService: SpeciesService {

    let networkService: NetworkClient
    
    func speciesList(for page: Int) async throws -> [Specie] {

         let data: Data = try await networkService.request(at: SpeciesListEndPoint(page: String(page)))
        
        return data.data.map {
            Specie(id: $0.id,
                   name: $0.common_name,
                   imageURL: $0.default_image?.thumbnail)
        }

//        return demoSpecies
    }
    
    func specieLastPage() async throws -> Int {
        
         let data: Data = try await networkService.request(at: SpeciesListEndPoint(page: "1"))
         return data.last_page
         
//        return 10
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
        let last_page: Int
    }

    private struct SpecieDetail: Decodable {
        let id: Int
        let common_name: String
        let default_image: DefaultImage?
    }

    private struct DefaultImage: Decodable {
        let thumbnail: String?
    }

}
