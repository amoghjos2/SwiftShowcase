//
//  SpeciesListViewModel.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

enum SpeciesListState {
    case loading
    case loaded([Specie])
    case error(Error)
}

protocol SpeciesListViewModel: ObservableObject {
    var speciesListState: SpeciesListState { get set }
    
    var species: [Specie] { get set }
    
    func loadSpecies()
}

class DefaultSpeciesListViewModel: SpeciesListViewModel {
    @Published var speciesListState: SpeciesListState = .loading
    
    var species = [Specie]()
    
    func loadSpecies() {
        
    }
}
