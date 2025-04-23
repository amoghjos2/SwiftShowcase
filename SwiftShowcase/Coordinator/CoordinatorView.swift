//
//  CoordinatorView.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/22/25.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
        
    var body: some View {
        #warning("I'm unsure why SwiftUI is recreating the main view again on navigation")
        NavigationStack(path: $coordinator.navigationPath) {
            coordinator.start()
                .navigationDestination(for: Specie.self) { specie in
                    coordinator.specieDetailView(for: specie)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
