//
//  CartViewModel.swift
//  Reciplease
//
//  Created by Zidouni on 12/05/2023.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var ingredients: [Ingredient] = [
        Ingredient(name: "Apple", icon: "🍏", isSelected: false),
        Ingredient(name: "Banana", icon: "🍌", isSelected: false),
        Ingredient(name: "Pear", icon: "🍐", isSelected: false),
        Ingredient(name: "Orange", icon: "🍊", isSelected: false),
        Ingredient(name: "Lemon", icon: "🍋", isSelected: false),
        Ingredient(name: "Watermelon", icon: "🍉", isSelected: false),
        Ingredient(name: "Grape", icon: "🍇", isSelected: false),
        Ingredient(name: "Strawberry", icon: "🍓", isSelected: false),
        Ingredient(name: "Blueberry", icon: "🫐", isSelected: false),
        Ingredient(name: "Melon", icon: "🍈", isSelected: false),
        Ingredient(name: "Cherry", icon: "🍒", isSelected: false),
        Ingredient(name: "Peach", icon: "🍑", isSelected: false),
        Ingredient(name: "Mango", icon: "🥭", isSelected: false),
        Ingredient(name: "Pineapple", icon: "🍍", isSelected: false),
        Ingredient(name: "Coconut", icon: "🥥", isSelected: false),
        Ingredient(name: "Kiwi", icon: "🥝", isSelected: false),
        Ingredient(name: "Tomato", icon: "🍅", isSelected: false),
        Ingredient(name: "Eggplant", icon: "🍆", isSelected: false),
        Ingredient(name: "Mushroom", icon: "🍄", isSelected: false),
        Ingredient(name: "Avocado", icon: "🥑", isSelected: false),
        Ingredient(name: "Broccoli", icon: "🥦", isSelected: false),
        Ingredient(name: "Lettuce", icon: "🥬", isSelected: false),
        Ingredient(name: "Cucumber", icon: "🥒", isSelected: false),
        Ingredient(name: "Hot pepper", icon: "🌶", isSelected: false),
        Ingredient(name: "Bell pepper", icon: "🫑", isSelected: false),
        Ingredient(name: "Corn", icon: "🌽", isSelected: false),
        Ingredient(name: "Carrot", icon: "🥕", isSelected: false),
        Ingredient(name: "Olive", icon: "🫒", isSelected: false),
        Ingredient(name: "Garlic", icon: "🧄", isSelected: false),
        Ingredient(name: "Onion", icon: "🧅", isSelected: false),
        Ingredient(name: "Potato", icon: "🥔", isSelected: false),
        Ingredient(name: "Sweet potato", icon: "🍠", isSelected: false),
        Ingredient(name: "Croissanr", icon: "🥐", isSelected: false),
        Ingredient(name: "Bagel", icon: "🥯", isSelected: false),
        Ingredient(name: "Baguette", icon: "🥖", isSelected: false),
        Ingredient(name: "Bread", icon: "🍞", isSelected: false),
        Ingredient(name: "Cheese", icon: "🧀", isSelected: false),
        Ingredient(name: "Egg", icon: "🥚", isSelected: false),
        Ingredient(name: "Butter", icon: "🧈", isSelected: false),
        Ingredient(name: "Waffel", icon: "🧇", isSelected: false),
        Ingredient(name: "Beef", icon: "🥩", isSelected: false),
        Ingredient(name: "Bacon", icon: "🥓", isSelected: false),
        Ingredient(name: "Chicken leg", icon: "🍗", isSelected: false),
        Ingredient(name: "Fries", icon: "🍟", isSelected: false),
        Ingredient(name: "Pita", icon: "🫓", isSelected: false),
        Ingredient(name: "Tomato sauce", icon: "🥫", isSelected: false),
        Ingredient(name: "Naruto", icon: "🍥", isSelected: false),
        Ingredient(name: "Oyster", icon: "🦪", isSelected: false),
        Ingredient(name: "Chocolate", icon: "🍫", isSelected: false),
        Ingredient(name: "Chestnut", icon: "🌰", isSelected: false),
        Ingredient(name: "Peanut", icon: "🥜", isSelected: false),
        Ingredient(name: "Bean", icon: "🫘", isSelected: false),
        Ingredient(name: "Snail", icon: "🐌", isSelected: false),
        Ingredient(name: "Octopus", icon: "🐙", isSelected: false),
        Ingredient(name: "Squid", icon: "🦑", isSelected: false),
        Ingredient(name: "Shrimp", icon: "🦐", isSelected: false),
        Ingredient(name: "Lobster", icon: "🦞", isSelected: false),
        Ingredient(name: "Crab", icon: "🦀", isSelected: false),
        Ingredient(name: "Rabbit", icon: "🐇", isSelected: false),
        Ingredient(name: "Duck", icon: "🦆", isSelected: false),
        Ingredient(name: "Fish", icon: "🐟", isSelected: false),
        Ingredient(name: "Chicken", icon: "🐓", isSelected: false),
        Ingredient(name: "Pork", icon: "🐷", isSelected: false),
        Ingredient(name: "Milk", icon: "🥛", isSelected: false),
        Ingredient(name: "Honey", icon: "🍯", isSelected: false),
        Ingredient(name: "Ice", icon: "🧊", isSelected: false),
        Ingredient(name: "Salt", icon: "🧂", isSelected: false),
    ]

    func addIngredient(name: String, icon: String, isSelected: Bool) {
        let newIngredient = Ingredient(name: name, icon: icon, isSelected: isSelected)
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


