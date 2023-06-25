//
//  RecipeViewModel.swift
//  Reciplease
//
//  Created by Zidouni on 21/06/2023.
//

import Foundation
import Alamofire
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Hit] = []
    @Published var isLoading = true
    
    private let apiRecipe = APIRecipe()
    
    func fetchRecipe(viewModel: CartViewModel) {
        self.recipes = []
        apiRecipe.getAPI(viewModel: viewModel ) { result in
            switch result {
            case .success(let recipe):
                self.recipes = recipe.hits
                print("dans le viewModel", self.recipes)
                self.isLoading = false
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func displayIngredientIcon(ingredientsApp: [Ingredient], ingredientsResponse: [IngredientsResponse]) -> [String: String] {
        var ingredientIcons: [String: String] = [:]
        
        for ingredientApp in ingredientsApp {
            for ingredientResponse in ingredientsResponse {
                if ingredientResponse.text.lowercased().contains(ingredientApp.name.lowercased()) {
                    ingredientIcons[ingredientApp.name.lowercased()] = ingredientApp.icon
                    break
                }
            }
        }
        print(ingredientIcons)
        
        return ingredientIcons
    }

    func getMatchingIcon(_ input: [String: String], ingredient: String) -> String {
        if let matchingKey = input.keys.first(where: { ingredient.contains($0) }),
           let matchingValue = input[matchingKey] {
            return matchingValue
        } else {
            return "🥣"
        }
    }
}
