//
//  SpecieView.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/16/25.
//

import SwiftUI

struct SpecieView: View {
    let name: String
    
    var body: some View {
        HStack {
            Image(systemName: "leaf")
            Text(name)
                .font(.headline)
        }
    }
}

#Preview {
    SpecieView(name: "Plant")
}
