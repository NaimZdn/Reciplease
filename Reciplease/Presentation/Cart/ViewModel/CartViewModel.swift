//
//  CartViewModel.swift
//  Reciplease
//
//  Created by Zidouni on 12/05/2023.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var ingredients: [Ingredient] = [
        Ingredient(name: "Apple", icon: "🍏"),
        Ingredient(name: "Banana", icon: "🍌"),
        Ingredient(name: "Pear", icon: "🍐"),
        Ingredient(name: "Orange", icon: "🍊"),
        Ingredient(name: "Lemon", icon: "🍋"),
        Ingredient(name: "Watermelon", icon: "🍉"),
        Ingredient(name: "Grape", icon: "🍇"),
        Ingredient(name: "Strawberry", icon: "🍓"),
        Ingredient(name: "Blueberry", icon: "🫐"),
        Ingredient(name: "Melon", icon: "🍈"),
        Ingredient(name: "Cherry", icon: "🍒"),
        Ingredient(name: "Peach", icon: "🍑"),
        Ingredient(name: "Mango", icon: "🥭"),
        Ingredient(name: "Pineapple", icon: "🍍"),
        Ingredient(name: "Coconut", icon: "🥥"),
        Ingredient(name: "Kiwi", icon: "🥝"),
        Ingredient(name: "Tomato", icon: "🍅"),
        Ingredient(name: "Eggplant", icon: "🍆"),
        Ingredient(name: "Mushroom", icon: "🍄"),
        Ingredient(name: "Avocado", icon: "🥑"),
        Ingredient(name: "Broccoli", icon: "🥦"),
        Ingredient(name: "Lettuce", icon: "🥬"),
        Ingredient(name: "Cucumber", icon: "🥒"),
        Ingredient(name: "Hot pepper", icon: "🌶"),
        Ingredient(name: "Bell pepper", icon: "🫑"),
        Ingredient(name: "Corn", icon: "🌽"),
        Ingredient(name: "Carrot", icon: "🥕"),
        Ingredient(name: "Olive", icon: "🫒"),
        Ingredient(name: "Garlic", icon: "🧄"),
        Ingredient(name: "Onion", icon: "🧅"),
        Ingredient(name: "Potato", icon: "🥔"),
        Ingredient(name: "Sweet potato", icon: "🍠"),
        Ingredient(name: "Croissanr", icon: "🥐"),
        Ingredient(name: "Bagel", icon: "🥯"),
        Ingredient(name: "Croissant", icon: "🥖"),
        Ingredient(name: "Bread", icon: "🍞"),
        Ingredient(name: "Cheese", icon: "🧀"),
        Ingredient(name: "Egg", icon: "🥚"),
        Ingredient(name: "Butter", icon: "🧈"),
        Ingredient(name: "Waffel", icon: "🧇"),
        Ingredient(name: "Beef", icon: "🥩"),
        Ingredient(name: "Bacon", icon: "🥓"),
        Ingredient(name: "Chicken leg", icon: "🍗"),
        Ingredient(name: "Fries", icon: "🍟"),
        Ingredient(name: "Pita", icon: "🫓"),
        Ingredient(name: "Tomato sauce", icon: "🥫"),
        Ingredient(name: "Naruto", icon: "🍥"),
        Ingredient(name: "Oyster", icon: "🦪"),
        Ingredient(name: "Chocolate", icon: "🍫"),
        Ingredient(name: "Chestnut", icon: "🌰"),
        Ingredient(name: "Peanut", icon: "🥜"),
        Ingredient(name: "Bean", icon: "🫘"),
        Ingredient(name: "Snail", icon: "🐌"),
        Ingredient(name: "Octopus", icon: "🐙"),
        Ingredient(name: "Squid", icon: "🦑"),
        Ingredient(name: "Shrimp", icon: "🦐"),
        Ingredient(name: "Lobster", icon: "🦞"),
        Ingredient(name: "Crab", icon: "🦀"),
        Ingredient(name: "Rabbit", icon: "🐇"),
        Ingredient(name: "Duc", icon: "🦆"),
        Ingredient(name: "Fish", icon: "🐟"),
        Ingredient(name: "Chicken", icon: "🐓"),
        Ingredient(name: "Pork", icon: "🐷"),
        Ingredient(name: "Milk", icon: "🥛"),
        Ingredient(name: "Honey", icon: "🍯"),
        Ingredient(name: "Ice", icon: "🧊"),
        Ingredient(name: "Salt", icon: "🧂"),
    ]

    func addIngredient(name: String, icon: String) {
        let newIngredient = Ingredient(name: name, icon: icon)
        ingredients.append(newIngredient)
    }
    
    func searchIngredients(text input: String) -> [Ingredient] {
        var ingredientsList: [Ingredient] = []
        
        for ingredient in ingredients {
            if ingredient.name.lowercased().contains(input.lowercased()) {
                ingredientsList.append(ingredient)
                
            }
        }
        return ingredientsList
    }
    
    func containsOnlySpaces(_ input: String) -> Bool {
        let trimmedInput = input.trimmingCharacters(in: .whitespaces)
        return trimmedInput.isEmpty
    }
    
    func removeLeadingSpaces(_ input: String) -> String {
        var components = input.components(separatedBy: .whitespaces)
        components.removeAll { $0.isEmpty }
        return components.joined(separator: " ")
    }
}


