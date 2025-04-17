//
//  SpeciesListView.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import SwiftUI

struct SpeciesListView: View {
    
    @ObservedObject var viewModel: SpeciesMainViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.species, id: \.id) { specie in
                SpecieView(name: specie.name)
                    .listRowSeparator(.hidden)
            }
            
            if viewModel.canLoadMoreSpecies {
                
                ProgressView()
                    .id(viewModel.species.count)
                    .frame(maxWidth: .infinity)
                    .listRowSeparator(.hidden)
                    .onAppear {
                        Task {
                            await viewModel.loadNextSpecies()
                        }
                    }
            }
        }
        
        .listStyle(.plain)
    }
}
