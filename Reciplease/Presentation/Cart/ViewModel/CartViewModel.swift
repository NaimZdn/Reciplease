//
//  CartViewModel.swift
//  Reciplease
//
//  Created by Zidouni on 12/05/2023.
//

import Foundation
import SwiftUI
import CoreData

class CartViewModel: ObservableObject {
    private var dataController: DataController

    @Published var ingredients: [Ingredient] = []
    @Published var ingredientsSelected: [Ingredient] = []
    @Published var showPopUp = false
    @Published var popUpMessage = ""
    @Published var popUpStatus = false

    private var context: NSManagedObjectContext

    init() {
        dataController = DataController.shared
        context = dataController.container.viewContext
        transformData()
    }
    
    private func transformData() {
        let sortedEntities = dataController.ingredientsData.sorted { $0.order < $1.order }
        
        for entity in sortedEntities {
            if let name = entity.name, let icon = entity.icon {
                let ingredient = Ingredient(name: name, icon: icon, isSelected: true)
                ingredients.append(ingredient)
            }
        }
    }

    func addIngredient(name: String, icon: String, isSelected: Bool) {
        let newIngredient = Ingredient(name: name, icon: icon, isSelected: isSelected)
        ingredients.append(newIngredient)
        
        popUpMessage = Message.addIngredient.rawValue
        popUpStatus = Message.addIngredient.status
        
        withAnimation(.easeInOut(duration: 0.6)) {
            self.showPopUp = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeInOut(duration: 0.2)) {
                self.showPopUp = false
            }
        }
        
        dataController.addIngredientToData(name: name, icon: icon)
    }
    
   func deleteIngredient(_ ingredient: Ingredient) {
        if let index = ingredientsSelected.firstIndex(of: ingredient) {
            ingredientsSelected.remove(at: index)
        }
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
    
    func bindingForIngredient(_ ingredient: Ingredient) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.ingredientsSelected.contains(ingredient) },
            set: { newValue in
                if newValue {
                    self.ingredientsSelected.append(ingredient)
                } else {
                    self.ingredientsSelected.removeAll { $0 == ingredient }
                }
            }
        )
    }
    
    func addToSelectedIngredients(_ ingredient: IngredientEntity) {
        if let name = ingredient.name, let icon = ingredient.icon {
            let ingredientSelected = Ingredient(name: name, icon: icon, isSelected: true)
            ingredientsSelected.append(ingredientSelected)
        }
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
    
    func isNotEmoji(_ string: String) -> Bool {
        let emojiRange = string.range(of: "\\p{Emoji}", options: .regularExpression)
        return emojiRange == nil && !string.isEmpty
    }
    
    func deleteIngredientInApp(_ ingredient: Ingredient) {
        if let index = ingredients.firstIndex(of: ingredient) {
            dataController.deleteIngredientData(name: ingredient.name)
            
            popUpMessage = Message.deleteIngredient.rawValue
            popUpStatus = Message.deleteIngredient.status
            
            withAnimation(.easeInOut(duration: 0.6)) {
                self.showPopUp = true
            }
            
            ingredients.remove(at: index)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    self.showPopUp = false
                }
            }
        }
    }
}
