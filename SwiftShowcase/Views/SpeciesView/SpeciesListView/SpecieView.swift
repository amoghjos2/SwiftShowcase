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
            Text(name)
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(uiColor: UIColor.secondarySystemBackground))
        .cornerRadius(5)
    }
}

#Preview {
    SpecieView(name: "Plant")
}
