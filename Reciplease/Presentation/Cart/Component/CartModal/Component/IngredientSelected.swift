//
//  IngredientSelected.swift
//  Reciplease
//
//  Created by Zidouni on 15/06/2023.
//

import SwiftUI

struct IngredientSelected: View {
    var icon: String
    var name: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text(icon)
                .font(.defaultBody)
                .foregroundColor(.primaryColor)
            
            Text(name)
                .font(.defaultBody)
                .foregroundColor(.primaryColor)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct IngredientSelected_Previews: PreviewProvider {
    static var previews: some View {
        IngredientSelected(icon: "🍏", name: "Apple")
    }
}
