//
//  File.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

protocol SpeciesService {
    func speciesList(for page: Int) async throws -> [Specie]
}
