//
//  APIRecipe.swift
//  Reciplease
//
//  Created by Zidouni on 20/06/2023.
//


import Foundation
import Combine
import Alamofire

class APIRecipe: ObservableObject {
    private let baseUrl = RecipeEndpoint.baseUrl
    private var cancellable: AnyCancellable?
    private var requestError: Errors? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    private func getAPIKey(fromFileNamed fileName: String) throws -> String {
        guard let envPath = Bundle.main.path(forResource: fileName, ofType: "plist"),
              let env = NSDictionary(contentsOfFile: envPath),
              let apiKey = env["RECIPE_API_KEY"] as? String else {
            throw Errors.apiKeyNotFound
        }
        return apiKey
    }
    
    private func getAPIId(fromFileNamed fileName: String) throws -> String {
        guard let envPath = Bundle.main.path(forResource: fileName, ofType: "plist"),
              let env = NSDictionary(contentsOfFile: envPath),
              let apiId = env["RECIPE_API_ID"] as? String else {
            throw Errors.apiKeyNotFound
        }
        return apiId
    }
    
    func getAPI(apiEnvFilename: String = "Env", viewModel: CartViewModel, completion: @escaping (Result<Recipe, Errors>) -> Void) {
        do {
            let apiKey = try getAPIKey(fromFileNamed: apiEnvFilename)
            let apiId = try getAPIId(fromFileNamed: apiEnvFilename)
            
            let ingredientNames = viewModel.ingredientsSelected.map { $0.name }.joined(separator: "+")
            print(ingredientNames.lowercased())
            
            let parameters: Parameters = [
                "app_key": apiKey,
                "app_id": apiId,
                "type": "public",
                "random": true,
                "q": ingredientNames.lowercased(),
                "field": ["label", "image", "ingredients", "calories", "totalTime", "digest", "yield", "url"]
                
            ]
            
            let encoding = URLEncoding(arrayEncoding: .noBrackets)
            
            AF.request(baseUrl, parameters: parameters, encoding: encoding)
                .validate()
                .publishDecodable(type: Recipe.self)
                .compactMap { $0.value }
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }, receiveValue: { response in
                    print("dans la requete de base", response)
                    completion(.success(response))
                })
                .store(in: &cancellables)
        } catch {
            completion(.failure(error as! Errors))
        }
    }
}
