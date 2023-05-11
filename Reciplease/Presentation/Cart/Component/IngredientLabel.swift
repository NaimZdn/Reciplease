//
//  IngredientLabel.swift
//  Reciplease
//
//  Created by Zidouni on 11/05/2023.
//

import SwiftUI

struct IngredientLabel: View {
    @State private var isSelected = false
    var ingredientIcon: String
    var ingredientName: String
    
    var body: some View {
        VStack {
            
            Button {
                isSelected.toggle()
            } label: {
                VStack(spacing: 10) {
                    Text(ingredientIcon)
                        .font(.defaultTitle)
                    
                    Text(ingredientName)
                        .font(.defaultBody)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: 170, minHeight: 105)
            
                .background(isSelected ? Color.selectorBackground : Color.labelBackground, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.selectorStroke, lineWidth: isSelected ? 1 : 0)
                )
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct IngredientLabel_Previews: PreviewProvider {
    
    static var previews: some View {
        IngredientLabel(ingredientIcon: Ingredient.fish.rawValue, ingredientName: Ingredient.fish.name)
    }
}
