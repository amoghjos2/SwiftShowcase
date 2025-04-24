//
//  CoordinatorView.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/22/25.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    @StateObject private var speciesMainViewModel = SwiftShowcaseFactory.speciesMainViewModel()
        
    var body: some View {
        
        NavigationStack(path: $coordinator.navigationPath) {
            
            SwiftShowcaseFactory.speciesMainView(viewModel: speciesMainViewModel)
                .navigationDestination(for: Specie.self) { specie in
                    
                    let viewModel = SwiftShowcaseFactory.specieDetailViewModel(for: specie.id)
                    SwiftShowcaseFactory.specieDetailView(viewModel: viewModel)
                }
                
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
