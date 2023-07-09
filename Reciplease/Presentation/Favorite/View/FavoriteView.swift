//
//  FavoriteView.swift
//  Reciplease
//
//  Created by Zidouni on 27/05/2023.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel: FavoriteViewModel
    
    @State private var searchText = ""
    @State private var selectedRecipe: Recipe? = nil
    @State private var showDish = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                VStack {
                    Text("Favorite")
                        .font(.defaultTitle)
                        .foregroundColor(Color.primaryColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    CustomTextField(text: $searchText, placeholder: "Search your recipe", charactersLimit: 25, size: 400, charactersCounter: false)
                    
                }
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 10)
            .background(Color.background)
            
            GeometryReader { geometry in
                if viewModel.recipes.isEmpty {
                    VStack(spacing: 10) {
                        Image(systemName: "bookmark")
                            .font(.system(size: 70))
                            .foregroundColor(Color.primaryColor)
                        
                        Text("Your favorites are empty")
                            .font(.defaultTitle2)
                            .foregroundColor(.primaryColor)
                            .multilineTextAlignment(.center)

                    }
                    .frame(width: geometry.size.width)
                    .frame(minHeight: geometry.size.height)
                    .opacity(0.6)
                    .ignoresSafeArea()
                    
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(Array(viewModel.recipes.enumerated().filter { searchText.isEmpty || $0.element.title.lowercased().contains(searchText.lowercased().trimmingCharacters(in: .whitespaces)) }).map(\.element), id: \.self) { recipe in
                                let dishBinding = Binding(
                                    get: { showDish },
                                    set: { newValue in
                                        if newValue {
                                            selectedRecipe = recipe
                                        }
                                        showDish = newValue
                                    }
                                )
                                
                                FavoriteCard(favoriteViewModel: viewModel, recipe: recipe, action: {
                                    dishBinding.wrappedValue = true
                                })
                                .sheet(isPresented: dishBinding) {
                                    DishView(cartViewModel: CartViewModel(),
                                             recipeViewModel: RecipeViewModel(),
                                             favoriteViewModel: viewModel,
                                             recipe: Recipe(title: selectedRecipe!.title,
                                                            stepsLink: selectedRecipe!.stepsLink,
                                                            image: selectedRecipe!.image,
                                                            kcalText: selectedRecipe!.kcalText,
                                                            tablewar: selectedRecipe!.tablewar,
                                                            timer: selectedRecipe!.timer,
                                                            protein: selectedRecipe!.protein,
                                                            fat: selectedRecipe!.fat,
                                                            carb: selectedRecipe!.carb,
                                                            ingredients: selectedRecipe!.ingredients))
                                }
                            }
                        }
                        .padding(.vertical, 20)
                    }
                }
                
            }
            .padding(.horizontal, 20)
        }
        .background(Color.background)

    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(viewModel: FavoriteViewModel())
    }
}
