//
//  DishView.swift
//  Reciplease
//
//  Created by Zidouni on 19/06/2023.
//

import SwiftUI

struct DishView: View {
    @Environment(\.openURL) var openURL
    
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var recipeViewModel: RecipeViewModel
    @ObservedObject var favoriteViewModel: FavoriteViewModel
    
    var recipe: Recipe
    var isFavorite: Bool {
        favoriteViewModel.isRecipeFavorite(recipe: recipe)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                ImageView(imageURL: URL(string: recipe.image)!)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .clipped()
                    .overlay {
                        HStack {
                            Button {
                                openURL(URL(string: recipe.stepsLink)!)
                            } label: {
                                Text("Follow the steps")
                                    .font(.defaultBody)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: 170, maxHeight: 40)
                                    .padding(.horizontal, 20)
                                    .background(Color.cardFavoriteLabel, in: RoundedRectangle(cornerRadius: 7))
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.top, 100)
                    }
                
                VStack { }
                .background(Color.background)
                
            }
            VStack {
                HStack {
                    Text(recipe.title)
                        .font(.defaultTitle)
                        .foregroundColor(.primaryColor)
                    
                    Spacer()
                    
                    DishFavoriteButton(isFavorite: isFavorite) {
                        favoriteViewModel.toggleFavorite(recipe: recipe)                        
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 10) {
                    if recipe.timer != "0" {
                        CardOption(optionText: "\(recipe.timer) min", optionIcon: "timer")
                            .padding(.vertical, 5)
                            .padding(.horizontal, 7)
                            .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
                    }
                    
                    CardOption(optionText: recipe.tablewar, optionIcon: "tablewar")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
                    
                    CardOption(optionText: recipe.kcalText, optionIcon: "kcal")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView {
                    HStack(spacing: 25) {
                        NutrimentLabel(nutrimentColor: .nutrimentProtein, title: "Protein", value: "\(recipe.protein) g")
                        NutrimentLabel(nutrimentColor: .nutrimentFat, title: "Fat", value: "\(recipe.fat) g")
                        NutrimentLabel(nutrimentColor: .nutrimentCarb, title: "Carb", value: "\(recipe.carb) g")
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 25)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Text("Ingredients")
                            .font(.defaultTitle2)
                            .foregroundColor(.primaryColor)
                        
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(recipe.ingredients.indices, id: \.self) { index in
                            let ingredient = recipe.ingredients[index]
                            let ingredientIcon = recipeViewModel.displayIngredientIcon(ingredientsApp: cartViewModel.ingredients, ingredientsResponse: recipe.ingredients)
                            let iconValue = recipeViewModel.getMatchingIcon(ingredientIcon, ingredient: ingredient)
                            
                            IngredientList(ingredient: iconValue, quantity: ingredient)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .background(Color.background, in: RoundedRectangle(cornerRadius: 35, style: .continuous))
            .padding(.top, -100)
        }
        .ignoresSafeArea()
    }
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView(cartViewModel: CartViewModel(),
                 recipeViewModel: RecipeViewModel(),
                 favoriteViewModel: FavoriteViewModel(), recipe: Recipe(title: "Chicken Ramen", stepsLink: "", image: "", kcalText: "264", tablewar: "1 person", timer: "14", protein: "36", fat: "56", carb: "25", ingredients: []))
    }
}
