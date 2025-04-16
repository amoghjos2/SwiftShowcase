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
        
    func loadSpecies() async
}

@MainActor
class DefaultSpeciesListViewModel: SpeciesListViewModel {
    
    let speciesListService: SpeciesListService
    
    init(speciesListService: SpeciesListService) {
        self.speciesListService = speciesListService
    }
    
    @Published var speciesListState: SpeciesListState = .loading
        
    func loadSpecies() async {
        do {
            let species = try await speciesListService.speciesList(for: 0)
            speciesListState = .loaded(species)
        } catch {
            speciesListState = .error(error)
        }
    }
}
