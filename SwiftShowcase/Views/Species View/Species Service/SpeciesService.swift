//
//  File.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

protocol SpeciesService {
    func species() async throws -> [Specie]
}
