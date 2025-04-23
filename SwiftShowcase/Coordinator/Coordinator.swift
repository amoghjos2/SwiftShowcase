//
//  SwiftShowcaseCoordinator.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/22/25.
//

import SwiftUI

class Coordinator: ObservableObject {
        
    @Published var navigationPath = NavigationPath()
    
    func start() -> SpeciesMainView {
        return SwiftShowcaseFactory.speciesMainView()
    }
    
    func didTapSpecie(_ specie: Specie) {
        navigationPath.append(specie)
    }
    
    func specieDetailView(for specie: Specie) -> SpecieDetailView {
        return SwiftShowcaseFactory.specieDetailView(for: specie.id)
    }
}
