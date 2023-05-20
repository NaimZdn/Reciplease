//
//  CartView.swift
//  Reciplease
//
//  Created by Zidouni on 11/05/2023.
//

import SwiftUI

struct CartView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel = CartViewModel()
    
    var body: some View {
        
        VStack {
            VStack() {
                Text("What's in your fridge ?")
                    .font(.defaultTitle)
                    .foregroundColor(Color.primaryColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 15) {
                    TextField("Search for a product", text: $searchText)
                        .font(.defaultPlaceholder)
                        .frame(maxWidth: 240)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.primaryColor)
                                .padding(.top, 35)
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    OptionButton(icon: "plus")
                    OptionButton(icon: "filter")
                    
                }
            }
            .padding(.vertical, 10)
            .background(Color.background)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(viewModel.ingredients) { ingredient in
                        IngredientLabel(ingredientIcon: ingredient.icon, ingredientName: ingredient.name)
                    }
                }
                .padding(.vertical, 20)
            }
        }
        .padding(.horizontal, 20)
        .background(Color.background)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
