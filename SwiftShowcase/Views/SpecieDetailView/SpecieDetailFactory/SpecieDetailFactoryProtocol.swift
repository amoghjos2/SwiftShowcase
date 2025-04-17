//
//  SpecieDetailFactory.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

protocol SpecieDetailFactoryProtocol {
    func specieDetailService(with networkService: NetworkService) -> SpecieDetailServiceProtocol
}
