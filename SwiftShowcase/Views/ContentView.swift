//
//  ContentView.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("let's do it!")
                .onAppear {
                    Task {
                        do {
                            let data = try await DefaultSpeciesListService().speciesList(for: 1)
                            print(data)
                        } catch {
                            print(error)
                        }

                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
