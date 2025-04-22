//
//  SpecieDetailView.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import SwiftUI

struct SpecieDetailView: View {
    
    @ObservedObject private var viewModel: SpecieDetailViewModel
    
    var body: some View {
        
        switch viewModel.loadingState {
        case .loading:
            ProgressView()
                .task {
                    await viewModel.loadSpecieDetail()
                }
            
        case .loaded(let specieDetail):
            List {
                SpecieDetailCell(
                    label: "Name",
                    value: specieDetail.name
                )
                
                SpecieDetailCell(
                    label: "Cycle",
                    value: specieDetail.cycle
                )
                
                SpecieDetailCell(
                    label: "Dimensions",
                    value: specieDetail.dimension
                )
                
                SpecieDetailCell(
                    label: "Type",
                    value: specieDetail.type
                )
                
                SpecieDetailCell(
                    label: "Watering",
                    value: specieDetail.watering
                )
            }
            
        case .error(let error):
            Text(error.localizedDescription)
        }
    }
}

struct SpecieDetailCell: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
        }
    }
}
