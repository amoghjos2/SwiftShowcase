//
//  SpeciesFactoryProtocol.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

protocol SpeciesFactoryProtocol {
    func specisesMainView(with factory: SpeciesFactoryProtocol) -> SpeciesMainView
    func speciesMainViewModel(with speciesService: SpeciesService?) -> SpeciesMainViewModel
    func speciesService(with networkService: NetworkService) -> SpeciesService
}
