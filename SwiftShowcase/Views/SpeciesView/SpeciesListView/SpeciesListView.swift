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
        NavigationStack {
            List {
                ForEach(viewModel.species, id: \.id) { specie in
                    SpecieView(name: specie.name)
                        .overlay {
                            NavigationLink(value: specie) { EmptyView() }
                                .opacity(0)
                        }
                        .listRowSeparator(.hidden)
                }
                
                if viewModel.canLoadMoreSpecies {
                    
                    ProgressView()
                        .id(viewModel.species.count) //.id is temporary fix to resolve SwiftUI bug of ProgressView() rendering issue in List
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
            .navigationDestination(for: Specie.self) { specie in
                #warning("chatGPT mentions that this is a bad practice as SwiftUI might create multiple instances of view model. The suggested approach seems like to create view model seperately and then pass it down")
                SwiftShowcaseFactory.specieDetailView(for: specie.id)
            }
        }
    }
}

#Preview {
    SpeciesListView(viewModel: SwiftShowcaseFactory.speciesMainViewModel())
}
