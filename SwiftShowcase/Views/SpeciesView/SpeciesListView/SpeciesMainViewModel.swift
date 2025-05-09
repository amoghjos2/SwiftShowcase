//
//  DefaultSpeciesListViewModel.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

class SpeciesMainViewModel: ObservableObject {
        
    enum SpeciesMainViewState {
        case loading
        case loaded
        case error(Error)
    }
    
    @Published var speciesMainViewState: SpeciesMainViewState = .loading
    @Published var species = [Specie]()
    @Published var canLoadMoreSpecies = true
    
    private var currentPage = 1
    private var lastPage = 1
    
    let speciesService: SpeciesService
    
    init(speciesService: SpeciesService) {
        self.speciesService = speciesService
    }
    
    @MainActor
    func setup() async {
        do {
            lastPage = try await speciesService.specieLastPage()
            await loadNextSpecies()
        } catch {
            speciesMainViewState = .error(error)
        }
    }

    @MainActor
    func loadNextSpecies() async {
        do {
            let species = try await speciesService.speciesList(for: currentPage)
            self.species += species
            speciesMainViewState = .loaded
            currentPage += 1
            canLoadMoreSpecies = currentPage <= lastPage
            
        } catch {
            speciesMainViewState = .error(error)
        }
    }
}
