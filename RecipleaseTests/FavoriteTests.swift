//
//  FavoriteTests.swift
//  RecipleaseTests
//
//  Created by Zidouni on 09/07/2023.
//

import XCTest
import CoreData
@testable import Reciplease

final class FavoriteTests: XCTestCase {

    var favorite: FavoriteViewModel!
    var dataController: DataController!
    var context: NSManagedObjectContext!
    
    override func setUp() {
        favorite = FavoriteViewModel()
        dataController = DataController.shared
        context = dataController.container.viewContext
    }
    
    override func tearDown() {
        let fetchRequest: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        
        do {
            let results = try context.fetch(fetchRequest)
            for recipeEntity in results {
                context.delete(recipeEntity)
            }
            
            try context.save()
        } catch {
            print("Failed to delete test data: \(error)")
        }
        
        favorite = nil
        dataController = nil
        context = nil
        
        super.tearDown()
    }
    
    func testGivenFetchRecipes_WhenRecipesExist_ThenFetchRecipesFromDataController() {
        let recipe1 = RecipeEntity(context: context)
        recipe1.title = "Chicken Ramen"
        
        do {
            try context.save()
        } catch {
            XCTFail("Failed to save recipe entities: \(error)")
        }

        favorite.fetchRecipes()
        
        XCTAssertEqual(favorite.recipes.count, 1)
        XCTAssertEqual(favorite.recipes[0].title, "Chicken Ramen")
      
    }
    
    func testGivenIngredientsArray_WhenConvertingToStringArray_ThenReturnStringArray() {
        let ingredients: [IngredientsResponse] = [
               IngredientsResponse(text: "Ingredient 1", quantity: 1.0, measure: "cup", food: "Food 1", weight: 100.0, foodCategory: "Category 1", foodID: "123", image: "image1.jpg"),
               IngredientsResponse(text: "Ingredient 2", quantity: 2.0, measure: "tbsp", food: "Food 2", weight: 50.0, foodCategory: "Category 2", foodID: "456", image: "image2.jpg")
           ]
           
        let result = favorite.convertToStringArray(ingredients: ingredients)
           
           let expectedOutput = ["Ingredient 1", "Ingredient 2"]
           XCTAssertEqual(result, expectedOutput)
    }
    
    
    func testGivenRecipeNotInFavorites_WhenTogglingFavorite_ThenRecipeIsAddedToFavoritesAndPopUpIsDisplayed() {
        let recipe = Recipe(title: "Test Recipe",
                            stepsLink: "https://example.com",
                            image: "recipe.jpg",
                            kcalText: "300 kcal",
                            tablewar: "Tablewar",
                            timer: "30 min",
                            protein: "20 g",
                            fat: "10 g",
                            carb: "50 g",
                            ingredients: ["Ingredient 1", "Ingredient 2"])
         
        XCTAssertFalse(favorite.isRecipeFavorite(recipe: recipe))
        
        favorite.toggleFavorite(recipe: recipe)
        
        XCTAssertTrue(favorite.isRecipeFavorite(recipe: recipe))
        XCTAssertEqual(favorite.popUpMessage, Message.addRecipeToFavorite.rawValue)
        XCTAssertEqual(favorite.popUpStatus, Message.addRecipeToFavorite.status)
    }

    func testGivenRecipeInFavorites_WhenTogglingFavorite_ThenRecipeIsRemovedFromFavoritesAndPopUpIsDisplayed() {
        let recipe = Recipe(title: "Test Recipe",
                            stepsLink: "https://example.com",
                            image: "recipe.jpg",
                            kcalText: "300 kcal",
                            tablewar: "Tablewar",
                            timer: "30 min",
                            protein: "20 g",
                            fat: "10 g",
                            carb: "50 g",
                            ingredients: ["Ingredient 1", "Ingredient 2"])
        
        favorite.addRecipeToFavorite(recipe: recipe)
        
        XCTAssertTrue(favorite.isRecipeFavorite(recipe: recipe))

        favorite.toggleFavorite(recipe: recipe)

        XCTAssertFalse(favorite.isRecipeFavorite(recipe: recipe))
        XCTAssertEqual(favorite.popUpMessage, Message.deleteRecipeFromFavorite.rawValue)
        XCTAssertEqual(favorite.popUpStatus, Message.deleteRecipeFromFavorite.status)
    }


    
    
    
    
    
    
    func testGivenDisplayPopUp_WhenCallingWithMessageAndStatus_ThenSetPopUpPropertiesAndShowPopUp() {
        let message = "Test message"
        let status = true

        favorite.displayPopUp(message: message, status: status)

        XCTAssertTrue(favorite.showPopUp)
        XCTAssertEqual(favorite.popUpMessage, message)
        XCTAssertEqual(favorite.popUpStatus, status)
        
        let expectation = XCTestExpectation(description: "Wait for delay")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
    
        XCTAssertFalse(favorite.showPopUp)
    }
    
    
}
