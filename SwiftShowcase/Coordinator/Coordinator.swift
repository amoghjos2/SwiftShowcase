//
//  SwiftShowcaseCoordinator.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/22/25.
//

import SwiftUI

class Coordinator: ObservableObject {
        
    @Published var navigationPath = NavigationPath()
    
    func didTapSpecie(_ specie: Specie) {
        navigationPath.append(specie)
    }
}
