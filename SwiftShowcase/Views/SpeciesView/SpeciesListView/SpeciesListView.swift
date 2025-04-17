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
                    ProgressViewCell()
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
    }
}

fileprivate struct ProgressViewCell: View {
    var body: some View {
        ProgressView()
            .frame(maxWidth: .infinity)
    }
}

//#Preview {
//    SpeciesListView(species: .constant([Specie(id: 12,
//                                               name: "Random Specie",
//                                               imageURL: "")]),
//                    shouldShowProgressIndicator: .constant(true))
//}
