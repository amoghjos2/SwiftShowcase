//
//  SpecieDetailViewModel.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import Foundation

class SpecieDetailViewModel: ObservableObject {
    
    enum SpecieDetailLoadingState {
        case loading
        case loaded(SpecieDetail)
        case error(Error)
    }
    
    @Published var loadingState: SpecieDetailLoadingState = .loading
        
    let specieDetailService: SpecieDetailServiceProtocol
    let specieID: Int
    
    init(specieDetailService: SpecieDetailServiceProtocol, specieID: Int) {
        self.specieDetailService = specieDetailService
        self.specieID = specieID
    }
    
    @MainActor
    func loadSpecieDetail() async {
        do {
            let specieDetail = try await specieDetailService.specieDetail(for: specieID)
            self.loadingState = .loaded(specieDetail)
        } catch {
            self.loadingState = .error(error)
        }
    }
}
