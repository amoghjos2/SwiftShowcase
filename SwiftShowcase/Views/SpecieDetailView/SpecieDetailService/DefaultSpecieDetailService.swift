//
//  SpecieDetailService.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

struct DefaultSpecieDetailService: SpecieDetailService {
    let networkService: NetworkService
    
    func specieDetail(for specieID: Int) async throws -> SpecieDetail {
        return try await networkService.request(at: SpecieDetailEndPoint(id: specieID))
//        return demoSpecieDetail
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
