//
//  CartModalView.swift
//  Reciplease
//
//  Created by Zidouni on 15/06/2023.
//

import SwiftUI

struct CartModalView: View {
    @Binding var ingredientSelected: [Ingredient]
    
    private func deleteIngredient(_ ingredient: Ingredient) {
        if let index = ingredientSelected.firstIndex(of: ingredient) {
            ingredientSelected.remove(at: index)
        }
    }
    
    var body: some View {
        if !ingredientSelected.isEmpty {
            VStack(alignment: .leading, spacing: 0) {
                Text("Cart")
                    .font(.defaultTitle)
                    .foregroundColor(.primaryColor)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                
                List {
                    ForEach(ingredientSelected, id: \.self) { ingredient in
                        IngredientSelected(icon: ingredient.icon, name: ingredient.name)
                            .listRowBackground(Color.background)
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteIngredient(ingredient)
                                } label: {
                                    Image(systemName: "cart.badge.minus")
                                }
                                .tint(.secondaryColor)
                            }
                    }
                }
                .cornerRadius(15)
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
                
                
                DeleteButton {
                    ingredientSelected.removeAll()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.background)
            
        } else {
            VStack(spacing: 10) {
                Spacer()
                
                Image(systemName: "cart")
                    .font(.system(size: 70))
                    .foregroundColor(Color.primaryColor)
                
                Text("Your cart is empty")
                    .font(.defaultTitle2)
                    .foregroundColor(.primaryColor)
                
              
                Spacer()
                
                    

                
            }
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
            .background(Color.background)
                
        }
    }
}


struct CartModalView_Previews: PreviewProvider {
    static var previews: some View {
        CartModalView(ingredientSelected: .constant([]))
    }
}
