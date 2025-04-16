//
//  SpeciesListView.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import SwiftUI

struct SpeciesListView: View {
    
    @StateObject var viewModel = SpeciesListViewModel()
    
    var body: some View {
        switch viewModel.speciesListState {
            
        case .loading:
            ProgressView()
                .task {
                    await viewModel.loadSpecies()
                }
            
        case .loaded(let species):
            
            Text("species: \(species)")
            
        case .error(let error):
            Text("The app ran into the following error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    SpeciesListView()
}
