//
//  CartModalView.swift
//  Reciplease
//
//  Created by Zidouni on 15/06/2023.
//

import SwiftUI

struct CartModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        if !viewModel.ingredientsSelected.isEmpty {
            VStack(alignment: .leading, spacing: 0) {
                Text("Cart")
                    .font(.defaultTitle)
                    .foregroundColor(.primaryColor)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                
                if #available(iOS 16.0, *) {
                    List {
                        ForEach(viewModel.ingredientsSelected, id: \.self) { ingredient in
                            IngredientSelected(icon: ingredient.icon, name: ingredient.name)
                                .accessibilityLabel(ingredient.name)
                                .accessibilityHint("Slide to your right to remove the ingredient from your cart")
                                .listRowBackground(Color.background)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        viewModel.removeIngredientSelected(ingredient)
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
                    
                } else {
                    List {
                        ForEach(viewModel.ingredientsSelected, id: \.self) { ingredient in
                            IngredientSelected(icon: ingredient.icon, name: ingredient.name)
                                .accessibilityLabel(ingredient.name)
                                .accessibilityHint("Slide to your right to remove the ingredient from your cart")
                                .listRowBackground(Color.background)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        viewModel.removeIngredientSelected(ingredient)
                                    } label: {
                                        Image(systemName: "cart.badge.minus")
                                    }
                                    .tint(.secondaryColor)
                                }
                                }
                    }
                    .padding(.top, 20)
                    .cornerRadius(15)
                    .listStyle(.plain)
                }
                
                DeleteButton {
                    viewModel.ingredientsSelected.removeAll()
                    presentationMode.wrappedValue.dismiss()
                }
                .padding(.bottom, 20)
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
            .accessibilityAddTraits(.isSummaryElement)
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
            .background(Color.background)
            
        }
    }
}

struct CartModalView_Previews: PreviewProvider {
    static var previews: some View {
        CartModalView(viewModel: CartViewModel())
    }
}
