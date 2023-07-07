//
//  DataController.swift
//  Reciplease
//
//  Created by Zidouni on 27/06/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    @Published var ingredientsData: [IngredientEntity] = []
    @Published var recipesData: [RecipeEntity] = []
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    static let shared = DataController()
    
    private init() {
        container = NSPersistentContainer(name: "RecipleaseDataModel")
        
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        
        context = container.viewContext
        addDefaultIngredientsIfNeeded()
        fetchIngredients()
    }
    
    private func fetchIngredients() {
        let fetchRequest: NSFetchRequest<IngredientEntity> = IngredientEntity.fetchRequest()
        do {
            self.ingredientsData = try context.fetch(fetchRequest)
        } catch {
            print("Erreur lors de la récupération des ingrédients : \(error)")
        }
    }
    
    private func addDefaultIngredientsIfNeeded() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "IngredientEntity")
        let count = try? context.count(for: fetchRequest)
        
        if count == 0 {
            let ingredientData = [
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
                Ingredient(name: "Croissant", icon: "🥐", isSelected: false),
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
                Ingredient(name: "Salt", icon: "🧂", isSelected: false),
            ]
            
            var order: Int16 = 0

            for data in ingredientData {
                let newIngredient = IngredientEntity(context: context)
                newIngredient.name = data.name
                newIngredient.icon = data.icon
                newIngredient.order = order
                ingredientsData.append(newIngredient)
                order += 1
            }
            
            do {
                try context.save()
            } catch {
                print("Erreur lors de l'enregistrement des ingrédients par défaut : \(error.localizedDescription)")
            }
        }
    }
    
    func addIngredientToData(name: String, icon: String) {
        let context = container.viewContext
        
        let ingredientEntity = IngredientEntity(context: context)
        ingredientEntity.name = name
        ingredientEntity.icon = icon
        
        do {
            try context.save()
        } catch {
            print("Erreur lors de l'enregistrement de l'ingrédient : \(error.localizedDescription)")
        }
    }
    
    func deleteIngredientData(name: String) {
        let context = container.viewContext
        
        let fetchRequest: NSFetchRequest<IngredientEntity> = IngredientEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let ingredientEntity = results.first {
                context.delete(ingredientEntity)
            }
            
            try context.save()
        } catch {
            print("Erreur lors de la suppression de l'ingrédient : \(error.localizedDescription)")
        }
    }
    
    func addRecipeToFavorite(_ recipe: Recipe) {
        let context = container.viewContext
        
        let recipeEntity = RecipeEntity(context: context)
        recipeEntity.title = recipe.title
        recipeEntity.stepsLink = recipe.stepsLink
        recipeEntity.image = recipe.image
        recipeEntity.kcalText = recipe.kcalText
        recipeEntity.tablewar = recipe.tablewar
        recipeEntity.timer = recipe.timer
        recipeEntity.protein = recipe.protein
        recipeEntity.fat = recipe.fat
        recipeEntity.carb = recipe.carb
        recipeEntity.ingredients = recipe.ingredients

        recipesData.append(recipeEntity)
        
        do {
            try context.save()
        } catch {
            print("Erreur lors de l'ajout de la recette aux favoris : \(error.localizedDescription)")
        }
    }
    
    func deleteRecipeFromFavorite(_ title: String) {
        let context = container.viewContext
        
        let fetchRequest: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let recipeEntity = results.first {
                context.delete(recipeEntity)
            }
            
            try context.save()
        } catch {
            print("Erreur lors de la suppression de la recette des favoris : \(error.localizedDescription)")
        }
    }
}
