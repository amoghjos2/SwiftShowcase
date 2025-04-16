//
//  LoadingState.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

enum LoadingState<T>{
    case loading
    case loaded(T)
    case error(Error)
}
