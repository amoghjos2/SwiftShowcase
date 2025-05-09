//
//  SpecieDetailService.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

struct DefaultSpecieDetailService: SpecieDetailService {
    let networkService: NetworkClient
    
    func specieDetail(for specieID: Int) async throws -> SpecieDetail {
        return try await networkService.request(at: SpecieDetailEndPoint(id: specieID))
    }
    
    private struct SpecieDetailEndPoint: SpeciesEndPoint {
        let id: Int
        
        var path: String {
            return "/api/species/details/\(id)"
        }
        
        var queryItems: [URLQueryItem]? {
            return baseQueryItems
        }
    }
}
