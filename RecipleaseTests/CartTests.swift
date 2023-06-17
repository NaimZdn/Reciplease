//
//  CartTests.swift
//  RecipleaseTests
//
//  Created by Zidouni on 17/06/2023.
//

import XCTest
@testable import Reciplease

final class CartTests: XCTestCase {

    var cart: CartViewModel!
    
    override func setUp() {
        cart = CartViewModel()
    }
    
    func testGivenAddIngredient_WhenUserCreateANewIngredient_ThenAddTheIngredientToTheIngrendientsArray() {
        let newIngredient = Ingredient(name: "Sauce BBQ", icon: "🥣", isSelected: false)
        
        cart.addIngredient(name: "Sauce BBQ", icon: "🥣", isSelected: false)
        
        let ingredientExists = cart.ingredients.contains { ingredient in
            ingredient.name == newIngredient.name &&
            ingredient.icon == newIngredient.icon &&
            ingredient.isSelected == newIngredient.isSelected
        }
        
        XCTAssertTrue(ingredientExists)
    }
    
    func testGivenDeleteIngredient_WhenUserDeleteAnSelectedIngredient_ThenDeleteTheIngredientToIngredientsSelectedArray() {
        cart.ingredientsSelected = [Ingredient(name: "Apple", icon: "🍏", isSelected: true), Ingredient(name: "Banana", icon: "🍌", isSelected: true)]
        
        cart.deleteIngredient(cart.ingredientsSelected[1])
        
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
        
        let result = cart.isNotEmoji(text)
        
        XCTAssertFalse(result)
    }

    func testGivenSearchIngredient_WhenTheInputContainsExtraSpaces_ThenDisplayAllIngredientCorrespondingToTheResearchWithoutExtraSpaces() {
        let searchText = "app     "
        let expectedResults = ["Apple", "Pineapple"]
        
        let searchResponse = cart.searchIngredients(text: cart.removeLeadingSpaces(searchText))
        
        let searchResults = searchResponse.map { $0.name }
        
        XCTAssertEqual(Set(searchResults), Set(expectedResults))
        
    }
}
