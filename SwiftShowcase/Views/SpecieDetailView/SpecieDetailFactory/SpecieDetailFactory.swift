//
//  SpecieDetailFactory.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

protocol SpecieDetailFactory {
    func specieDetailService(with networkService: NetworkService) -> SpecieDetailService
    func specieDetailViewModel(for specieID: Int, with specieDetailService: SpecieDetailService?) -> SpecieDetailViewModel
    func specieDetailView(with factory: SpecieDetailFactory,
                          for specieID: Int) -> SpecieDetailView
}
