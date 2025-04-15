//
//  File.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

protocol SpeciesListService {
    func speciesList(for page: Int) async throws -> [Specie]
}
