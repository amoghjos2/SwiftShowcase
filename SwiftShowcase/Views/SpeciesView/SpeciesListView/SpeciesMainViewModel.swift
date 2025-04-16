//
//  DefaultSpeciesListViewModel.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

class SpeciesMainViewModel: ObservableObject {
    
    let speciesListService: SpeciesListService
    
    init(speciesListService: SpeciesListService = DefaultSpeciesListService()) {
        self.speciesListService = speciesListService
    }
    
    @Published var speciesListState: LoadingState<[Specie]> = .loading
    @Published var species = [Specie]()
    @Published var isLoadingMoreSpecies: Bool = false
    
    private var currentPage = 1
    private var lastPage = 1

    @MainActor
    func loadSpecies() async {
        do {
            isLoadingMoreSpecies = true
            let species = try await speciesListService.speciesList(for: 6)
            speciesListState = .loaded
            self.species = species
            isLoadingMoreSpecies = false
        } catch {
            speciesListState = .error(error)
        }
    }
}
