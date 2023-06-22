//
//  Errors.swift
//  Reciplease
//
//  Created by Zidouni on 21/06/2023.
//

import Foundation

enum Errors : Error {
    case apiKeyNotFound
    case exchangeRateAlreadyAvailable
    case invalidParameters
    case unauthorizedAccess
    case networkError
    case pasteError
    
    var errorDescription: String {
        switch self {
        case .apiKeyNotFound:
            return "Your APIKey was not found"
        case .exchangeRateAlreadyAvailable:
            return "You already have the exchange rate for this currency"
        case .invalidParameters:
            return "One of your parameters is invalid"
        case .unauthorizedAccess:
            return "Access denied, please check your API Key"
        case .networkError:
            return "We can't load data, please check your connection"
        case .pasteError:
            return "Your clipboard is empty"
        }
    }
}
