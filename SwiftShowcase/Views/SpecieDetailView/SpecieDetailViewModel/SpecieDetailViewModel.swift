//
//  SpecieDetailViewModel.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

class SpecieDetailViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .loading
    var specieDetail: SpecieDetail?
}
