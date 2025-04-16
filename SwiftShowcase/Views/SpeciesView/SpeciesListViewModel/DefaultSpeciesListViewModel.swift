//
//  DefaultSpeciesListViewModel.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

class DefaultSpeciesListViewModel: SpeciesListViewModel {
    
    let speciesListService: SpeciesListService
    
    init(speciesListService: SpeciesListService) {
        self.speciesListService = speciesListService
    }
    
    @Published var speciesListState: LoadingState<[Specie]> = .loading

    @MainActor
    func loadSpecies() async {
        do {
            let species = try await speciesListService.speciesList(for: 0)
            speciesListState = .loaded(species)
        } catch {
            speciesListState = .error(error)
        }
    }
}
