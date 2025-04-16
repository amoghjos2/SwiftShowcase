//
//  SpeciesListViewModel.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

protocol SpeciesListViewModel: ObservableObject {
    
    associatedtype T
    
    var speciesListState: LoadingState<T> { get set }
        
    func loadSpecies() async
}
