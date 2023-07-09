//
//  PopUp.swift
//  Reciplease
//
//  Created by Zidouni on 18/06/2023.
//

import Foundation

enum Message: String {
    case addIngredient = "Your ingredient has been created !"
    case deleteIngredient = "Your ingredient has been deleted !"
    case deleteCart = "Your cart has been emptied !"
    case addIngredientAlreadyExist = "This ingredient is already available !"
    case addRecipeToFavorite = "The recipe as added to your favorites"
    case deleteRecipeFromFavorite = "The recipe was removed from your favorites"
    
    var status: Bool {
        switch self {
        case .addIngredient:
            return true
        case .deleteIngredient:
            return true
        case .deleteCart:
            return true
        case .addIngredientAlreadyExist:
            return false
        case .addRecipeToFavorite:
            return true
        case .deleteRecipeFromFavorite:
            return true
        }
    }
}
