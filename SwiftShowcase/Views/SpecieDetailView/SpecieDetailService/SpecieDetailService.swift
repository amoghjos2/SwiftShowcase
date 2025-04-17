//
//  SpecieDetailServiceProtocol.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

protocol SpecieDetailService {
    func specieDetail(for specieID: Int) async throws -> SpecieDetail
}
