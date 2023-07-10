//
//  FavoriteViewModel.swift
//  Reciplease
//
//  Created by Zidouni on 01/07/2023.
//

import Foundation
import CoreData
import SwiftUI

class FavoriteViewModel: ObservableObject {
    @ObservedObject private var dataController = DataController.shared
    @Published var showPopUp = false
    @Published var popUpMessage = ""
    @Published var popUpStatus = false
    @Published var isFavoriteRecipe = false
    
    @Published var recipes: [Recipe] = []
    
    init() {
        fetchRecipes()
    }
    
    func fetchRecipes() {
        let fetchRequest: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        
        do {
            let results = try dataController.container.viewContext.fetch(fetchRequest)
            recipes = results.map { recipe in
                Recipe(title: recipe.title ?? "",
                       stepsLink: recipe.stepsLink ?? "",
                       image: recipe.image ?? "",
                       kcalText: recipe.kcalText ?? "",
                       tablewar: recipe.tablewar ?? "",
                       timer: recipe.timer ?? "",
                       protein: recipe.protein ?? "",
                       fat: recipe.fat ?? "",
                       carb: recipe.carb ?? "",
                       ingredients: recipe.ingredients ?? [])
            }
        } catch {
            print("Failed to fetch recipes: \(error)")
        }
    }
    
    func convertToStringArray(ingredients: [IngredientsResponse]) -> [String] {
        return ingredients.map { $0.text }
    }
    
    func addRecipeToFavorite(recipe: Recipe) {
        dataController.addRecipeToFavorite(recipe)
        recipes.append(recipe)

        displayPopUp(message: Message.addRecipeToFavorite.rawValue,
                     status: Message.addRecipeToFavorite.status
        )
    }
    
    func deleteRecipeFromFavorite(recipe: Recipe) {
        dataController.deleteRecipeFromFavorite(recipe.title)
        recipes.removeAll { $0.title == recipe.title }
        
        displayPopUp(message: Message.deleteRecipeFromFavorite.rawValue,
                     status: Message.deleteRecipeFromFavorite.status
        )
    }
    
    func toggleFavorite(recipe: Recipe)  {
        if isRecipeFavorite(recipe: recipe) {
            deleteRecipeFromFavorite(recipe: recipe)
            
        } else {
            addRecipeToFavorite(recipe: recipe)
        }
    }
    
    func isRecipeFavorite(recipe: Recipe) -> Bool {
        return recipes.contains { $0.title == recipe.title }
    }
    
    func displayPopUp(message: String, status: Bool) {
        popUpMessage = message
        popUpStatus = status
        
        withAnimation(.easeInOut(duration: 0.6)) {
            self.showPopUp = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeInOut(duration: 0.2)) {
                self.showPopUp = false
            }
        }
    }
}
