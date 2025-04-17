//
//  SpeciesListView.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import SwiftUI

struct SpeciesMainView: View {
        
    @StateObject var viewModel: SpeciesMainViewModel

    let factory: SpeciesFactoryProtocol

    init(factory: SpeciesFactoryProtocol) {
        self.factory = factory
        _viewModel = StateObject(wrappedValue: factory.speciesMainViewModel(with: nil))
    }
    
    var body: some View {
        switch viewModel.speciesListState {
            
        case .loading:
            ProgressView()
                .task {
                    await viewModel.setup()
                }
            
        case .loaded:
            SpeciesListView(viewModel: viewModel)
            
        case .error(let error):
            Text("The app ran into the following error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    SpeciesMainView(factory: DefaultSpeciesFactory())
}
