//
//  CartTests.swift
//  RecipleaseTests
//
//  Created by Zidouni on 17/06/2023.
//

import XCTest
import CoreData
@testable import Reciplease

final class CartTests: XCTestCase {

    var cart: CartViewModel!
    var dataController: DataController!
    var context: NSManagedObjectContext!
    
    override func setUp() {
        cart = CartViewModel()
        dataController = DataController.shared
        context = dataController.container.viewContext
    }
    
    func testGivenAddIngredientInApp_WhenUserCreateANewIngredient_ThenAddTheIngredientToTheIngrendientsArray() {
        let newIngredient = Ingredient(name: "Sauce BBQ", icon: "🥣", isSelected: false)
        
        cart.addIngredientInApp(name: "Sauce BBQ", icon: "🥣", isSelected: false)
        
        let ingredientExists = cart.ingredients.contains { ingredient in
            ingredient.name == newIngredient.name &&
            ingredient.icon == newIngredient.icon &&
            ingredient.isSelected == newIngredient.isSelected
        }
        
        XCTAssertTrue(ingredientExists)
    }
    
    func testGivenRemoveIngredientSelected_WhenUserRemoveAnSelectedIngredient_ThenRemoveTheIngredientToIngredientsSelectedArray() {
        cart.ingredientsSelected = [Ingredient(name: "Apple", icon: "🍏", isSelected: true), Ingredient(name: "Banana", icon: "🍌", isSelected: true)]
        
        cart.removeIngredientSelected(cart.ingredientsSelected[1])
        
        XCTAssertTrue(cart.ingredientsSelected.count == 1)
        
    }
    
    func testGivenSearchIngredient_WhenUserWantToSearchASpecificIngredient_ThenDisplayAllIngredientCorrespondingToTheResearch() {
        let searchText = "app"
        let expectedResults = ["Apple", "Pineapple"]
        
        let searchResponse = cart.searchIngredients(text: searchText)
        let searchResults = searchResponse.map { $0.name } 
        
        XCTAssertEqual(Set(searchResults), Set(expectedResults))
        
    }
    
    func testBindingForIngredient_WhenIngredientIsAddedOrRemoved_UpdatesIngredientsSelectedArray() {
        let testIngredient = Ingredient(name: "Red Apple", icon: "🍎", isSelected: false)
        let ingredientBinding = cart.bindingForIngredient(testIngredient)
        
        XCTAssertFalse(ingredientBinding.wrappedValue)
        
        ingredientBinding.wrappedValue = true
        XCTAssertTrue(cart.ingredientsSelected.contains(testIngredient))
        
        ingredientBinding.wrappedValue = false
        XCTAssertFalse(cart.ingredientsSelected.contains(testIngredient))
    }
    
    func testGivenContainsOnlySpaces_WhenTheStringContainsOnlySpaces_ThenReturnTrue() {
        let text = "     "
        
        let result = cart.containsOnlySpaces(text)
        
        XCTAssertTrue(result)
    }
    
    func testGivenRemoveLeadingSpaces_WhenTheStringContainsOnlySpacesAfterThereCharacters_ThenReturnAStringWithoutExtraSpaces() {
        let text = "App    "
        
        let result = cart.removeLeadingSpaces(text)
        
        XCTAssertEqual(result, "App")
    }
    
    func testGivenIsNotEmoji_WhenTheStringIsAnEmoji_ThenReturnFalse() {
        let text = "🍏"
        XCTAssertFalse(cart.isNotEmoji(text))
    }
    
    func testGivenIsNotEmoji_WhenTheStringIsEmpty_ThenReturnFalse() {
        let emptyText = ""
        XCTAssertFalse(cart.isNotEmoji(emptyText))
    }

    func testGivenIsNotEmoji_WhenTheStringIsNonEmptyNonEmoji_ThenReturnTrue() {
        let nonEmojiText = "This is a non-emoji text"
        XCTAssertTrue(cart.isNotEmoji(nonEmojiText))
    }

    func testGivenSearchIngredient_WhenTheInputContainsExtraSpaces_ThenDisplayAllIngredientCorrespondingToTheResearchWithoutExtraSpaces() {
        let searchText = "app     "
        let expectedResults = ["Apple", "Pineapple"]
        
        let searchResponse = cart.searchIngredients(text: cart.removeLeadingSpaces(searchText))
        
        let searchResults = searchResponse.map { $0.name }
        
        XCTAssertEqual(Set(searchResults), Set(expectedResults))
        
    }
    
    func testGivenDeleteIngredientInApp_WhenUserWantToDeleteTheIngredient_ThenDeleteTheIngredientInApp() {
        let ingredient = Ingredient(name: "Carrot", icon: "🥕", isSelected: false)
        
        cart.ingredients = cart.ingredients + [ingredient]
        
        cart.deleteIngredientInApp(ingredient)
        
        XCTAssertFalse(cart.ingredients.contains(ingredient))
        
        let fetchRequest: NSFetchRequest<IngredientEntity> = IngredientEntity.fetchRequest()
        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "name == %@", "Carrot"),
            NSPredicate(format: "order >= %@", NSNumber(value: dataController.ingredientsData.count))
        ])
        
        do {
            let results = try context.fetch(fetchRequest)
            XCTAssertTrue(results.isEmpty)
        } catch {
            XCTFail("Erreur lors de la récupération des ingrédients : \(error)")
        }
    }
    
    func testGivenAddToSelectedIngredients_WhenAddingIngredientEntity_ThenAddIngredientToSelectedIngredients() {
        let ingredientEntity = IngredientEntity(context: context)
        ingredientEntity.name = "Carrot"
        ingredientEntity.icon = "🥕"
        
        cart.addToSelectedIngredients(ingredientEntity)
        
        XCTAssertTrue(cart.ingredientsSelected.contains { $0.name == "Carrot" && $0.icon == "🥕" && $0.isSelected })
    }
    
    func testGivenDisplayPopUp_WhenCallingWithMessageAndStatus_ThenSetPopUpPropertiesAndShowPopUp() {
        let message = "Test message"
        let status = true

        cart.displayPopUp(message: message, status: status)

        XCTAssertTrue(cart.showPopUp)
        XCTAssertEqual(cart.popUpMessage, message)
        XCTAssertEqual(cart.popUpStatus, status)
        
        let expectation = XCTestExpectation(description: "Wait for delay")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
    
        XCTAssertFalse(cart.showPopUp)
    }
}
