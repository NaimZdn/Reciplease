//
//  RecipeTests.swift
//  RecipleaseTests
//
//  Created by Zidouni on 25/06/2023.
//

import XCTest
@testable import Reciplease

final class RecipeTests: XCTestCase {
    
    var recipe: RecipeViewModel!
    var cart: CartViewModel!
    var apiRecipe: APIRecipe!
    var envPlistPath: String!
    var originalEnvPlist: NSDictionary!
    
    override func setUp() {
        recipe = RecipeViewModel()
        cart = CartViewModel()
        apiRecipe = APIRecipe()
        
        let fileManager = FileManager.default
        envPlistPath = Bundle.main.path(forResource: "Env", ofType: "plist")!
        originalEnvPlist = NSDictionary(contentsOfFile: envPlistPath)
        try? fileManager.copyItem(atPath: envPlistPath, toPath: envPlistPath + ".backup")
        
    }
    
    override func tearDown() {
        super.tearDown()
        recipe = nil
        cart = nil
        apiRecipe = nil
        
        let fileManager = FileManager.default
        try? fileManager.removeItem(atPath: envPlistPath)
        try? fileManager.moveItem(atPath: envPlistPath + ".backup", toPath: envPlistPath)
    }
    
    func testGivenIngredientsSelected_WhenFetchingRecipe_ThenRecipeCountIsCorrect() {
        cart.ingredientsSelected = [
            Ingredient(name: "Apple", icon: "🍏", isSelected: true),
            Ingredient(name: "Orange", icon: "🍊", isSelected: true)
        ]
        let expectation = XCTestExpectation(description: "API request")
        
        recipe.fetchRecipe(viewModel: cart)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertEqual(self.recipe.recipes.count, 20)
            XCTAssertFalse(self.recipe.isLoading)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGivenInvalidAPIKey_WhenFetchingRecipe_ThenErrorIsAPIKeyNotFound() {
        let envFile = "Env_test"
        
        cart.ingredientsSelected = [
            Ingredient(name: "Apple", icon: "🍏", isSelected: true),
            Ingredient(name: "Orange", icon: "🍊", isSelected: true)
        ]
        let expectation = XCTestExpectation(description: "API request")
        
        apiRecipe.getAPI(apiEnvFilename: envFile, viewModel: cart) { result in
            switch result {
            case .success:
                XCTFail("Test failed because success")
            case .failure(let error):
                XCTAssertTrue(error == Errors.apiKeyNotFound)
            }
            expectation.fulfill()
        }
    
        wait(for: [expectation], timeout: 2.0)
    }
    
    
    func testGivenFetchedApi_WhenTryingToParseData_ThenReceiveRecipe() throws {
        guard let filePath = Bundle(for: type(of: self)).path(forResource: "RecipeData", ofType: "json") else {
            XCTFail("JSON file not found.")
            return
        }
        
        let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath))
        
        do {
            let decoder = JSONDecoder()
            let recipe = try decoder.decode(RecipeData.self, from: jsonData)
            
            XCTAssertEqual(recipe.hits[0].recipe.calories, 1434.3162337833614)
            XCTAssertEqual(recipe.hits[0].recipe.url, "https://www.menshealth.com/recipes/grilled-chicken-with-bodacious-bean-relish" )
            
        } catch {
            XCTFail("Error parsing JSON: \(error)")
        }
    }

    func testGivenDisplayIngredientIcon_WhenProvidingIngredientsAppAndIngredientsResponse_ThenReturnDictionaryWithMatchingIcons() {
        let ingredientsApp: [Ingredient] = [
            Ingredient(name: "Apple", icon: "🍏", isSelected: false),
            Ingredient(name: "Banana", icon: "🍌", isSelected: false),
            Ingredient(name: "Carrot", icon: "🥕", isSelected: false)
        ]
        
        let ingredientsResponse = ["Apple", "Banana", "Carrot"]
        
        let result = recipe.displayIngredientIcon(ingredientsApp: ingredientsApp, ingredientsResponse: ingredientsResponse)
        
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result["apple"], "🍏")
        XCTAssertEqual(result["banana"], "🍌")
        XCTAssertEqual(result["carrot"], "🥕")
    }
    
    func testGivenGetMatchingIcon_WhenProvidingInputAndIngredient_ThenReturnMatchingIconOrDefaultIcon() {
        let input: [String: String] = [
            "Apple": "🍏",
            "Banana": "🍌",
            "Carrot": "🥕"
        ]
        
        let ingredient = "Red Apple"
        let ingredient2 = "Tomato"
        
        let result = recipe.getMatchingIcon(input, ingredient: ingredient)
        let result2 = recipe.getMatchingIcon(input, ingredient: ingredient2)
        
        XCTAssertEqual(result, "🍏")
        XCTAssertEqual(result2, "🥣")
    }
}
