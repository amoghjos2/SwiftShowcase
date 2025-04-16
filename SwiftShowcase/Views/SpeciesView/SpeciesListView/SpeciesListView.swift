//
//  SpeciesListView.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import SwiftUI

struct SpeciesListView: View {
    @Binding var species: [Specie]
    @Binding var isLoading: Bool
    
    var body: some View {
            List {
                ForEach(species, id: \.id) { specie in
                    SpecieView(name: specie.name)
                        .listRowSeparator(.hidden)

                }
                
                if isLoading {
                    ProgressViewCell()
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
    }
}

fileprivate struct ProgressViewCell: View {
    var body: some View {
        HStack {
            Spacer()
            
            ProgressView()

            Spacer()
        }
    }
}

#Preview {
    SpeciesListView(species: .constant([Specie(id: 12,
                                               name: "Random Specie",
                                               imageURL: "")]),
                    isLoading: .constant(true))
}
