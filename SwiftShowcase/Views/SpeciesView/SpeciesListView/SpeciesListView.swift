//
//  SpeciesListView.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import SwiftUI

protocol Contract {
    
}

struct SpeciesListView: View {
    @Binding var species: [Specie]
    @Binding var shouldShowProgressIndicator: Bool
        
    var body: some View {
            List {
                ForEach(species, id: \.id) { specie in
                    SpecieView(name: specie.name)
                        .listRowSeparator(.hidden)

                }
                
                if shouldShowProgressIndicator {
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

#Preview {
    SpeciesListView(species: .constant([Specie(id: 12,
                                               name: "Random Specie",
                                               imageURL: "")]),
                    shouldShowProgressIndicator: .constant(true))
}
