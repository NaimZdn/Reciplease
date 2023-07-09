//
//  IngredientLabel.swift
//  Reciplease
//
//  Created by Zidouni on 11/05/2023.
//

import SwiftUI

struct IngredientLabel: View {
    @ObservedObject var viewModel: CartViewModel
    
    @Binding var ingredientsSelected: [Ingredient]
    @Binding var isSelected: Bool
    var ingredientIcon: String
    var ingredientName: String
    var ingredient: Ingredient
    
    @State private var selection = "Delete"
    @State private var isPickerVisible = false
    let colors = ["Delete"]
    
    var body: some View {
        VStack {
            Button {
                isSelected.toggle()
                
            } label: {
                ZStack(alignment: .topTrailing) {
                    if !isSelected {
                        Menu {
                            Button(role: .destructive) {
                               viewModel.deleteIngredientInApp(ingredient)
                            } label: {
                                HStack {
                                    Text("Delete")
                                        .font(.defaultBody)
                                        .foregroundColor(.red)
                                    
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.primaryColor)
                                .padding(12)
                                .opacity(0.6)
                            
                        }
                        .onTapGesture {
                            isSelected = false
                        }
                    }
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
                }
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
    @ObservedObject static private var dataController = DataController.shared
    
    static var previews: some View {
        IngredientLabel(viewModel: CartViewModel(), ingredientsSelected: .constant([]), isSelected: .constant(false), ingredientIcon: viewModel.ingredients[1].icon, ingredientName: viewModel.ingredients[1].name, ingredient: viewModel.ingredients[1])
    }
}
