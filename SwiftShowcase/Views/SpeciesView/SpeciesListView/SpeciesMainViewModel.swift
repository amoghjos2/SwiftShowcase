//
//  DefaultSpeciesListViewModel.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

class SpeciesMainViewModel: ObservableObject {
    
    let speciesListService: SpeciesService
    
    init(speciesListService: SpeciesService = DefaultSpeciesService()) {
        self.speciesListService = speciesListService
    }
    
    @Published var speciesListState: LoadingState = .loading
    @Published var species = [Specie]()
    @Published var canLoadMoreSpecies = true
    
    private var currentPage = 1
    private var lastPage = 1

    @MainActor
    func loadNextSpecies() async {
        do {
            let species = try await speciesListService.speciesList(for: currentPage)
            self.species = species
            speciesListState = .loaded
            currentPage += 1
            canLoadMoreSpecies = currentPage <= lastPage
            
        } catch {
            speciesListState = .error(error)
        }
    }
}
