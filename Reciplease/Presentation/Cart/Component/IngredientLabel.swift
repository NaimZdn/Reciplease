//
//  IngredientLabel.swift
//  Reciplease
//
//  Created by Zidouni on 11/05/2023.
//

import SwiftUI

struct IngredientLabel: View {
    @Binding var ingredientsSelected: [Ingredient]
    @Binding var isSelected: Bool
    var ingredientIcon: String
    var ingredientName: String
    
    
    @ObservedObject private var viewModel = CartViewModel()
    
    var body: some View {
        VStack {
            Button {
                isSelected.toggle()
            } label: {
                VStack(spacing: 10) {
                    Text(ingredientIcon)
                        .font( viewModel.isNotEmoji(ingredientIcon) ? .defaultTitle2 : .defaultTitle)
                        .background(
                            viewModel.isNotEmoji(ingredientIcon) ? Color.addIngredientIcon
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .mask(
                                    Capsule()
                                        .fill()
                                        .frame(width: 30, height: 30, alignment: .topLeading)
                                ) : nil
                        )
                        .padding(.vertical,  viewModel.isNotEmoji(ingredientIcon) ? 5 : 0 )
                    
                    Text(ingredientName)
                        .font(.defaultBody)
                        .foregroundColor(.cardTitleIcon)
                }
                .frame(maxWidth: 170, minHeight: 105)
            
                .background(isSelected ? Color.selectorBackground : Color.labelBackground, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.selectorStroke, lineWidth: isSelected ? 1 : 0)
                )
            }
            .disabled(ingredientsSelected.count >= 9 && !isSelected)
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct IngredientLabel_Previews: PreviewProvider {
    
    @ObservedObject static private var viewModel = CartViewModel()
    
    static var previews: some View {
        IngredientLabel(ingredientsSelected: .constant([]), isSelected: .constant(false), ingredientIcon: viewModel.ingredients[1].icon, ingredientName: viewModel.ingredients[1].name)
    }
}
