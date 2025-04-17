//
//  DefaultSpeciesListViewModel.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

class SpeciesMainViewModel: ObservableObject {
        
    @Published var speciesListState: LoadingState = .loading
    @Published var species = [Specie]()
    @Published var canLoadMoreSpecies = true
    
    private var currentPage = 1
    private var lastPage = 1
    
    let speciesService: SpeciesService
    
    init(with speciesService: SpeciesService) {
        self.speciesService = speciesService
    }
    
    @MainActor
    func setup() async {
        do {
            lastPage = try await speciesService.specieLastPage()
            await loadNextSpecies()
        } catch {
            speciesListState = .error(error)
        }
    }

    @MainActor
    func loadNextSpecies() async {
        do {
            let species = try await speciesService.speciesList(for: currentPage)
            self.species += species
            speciesListState = .loaded
            currentPage += 1
            canLoadMoreSpecies = currentPage <= lastPage
            
        } catch {
            speciesListState = .error(error)
        }
    }
}
