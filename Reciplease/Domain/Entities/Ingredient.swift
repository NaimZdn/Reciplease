//
//  Ingredient.swift
//  Reciplease
//
//  Created by Zidouni on 11/05/2023.
//

import Foundation

enum Ingredient: String, CaseIterable {
    case beef = "🥩"
    case potato = "🥔"
    case fish = "🐟"
    case bread = "🍞"
    case avocado = "🥑"
    
    var name: String {
        switch self {
        case .beef:
            return "Beef"
        case .potato:
            return "Potato"
        case .fish:
            return "Fish"
        case .bread:
            return "Bread"
        case .avocado:
            return "Avocado"
        }
    }
}
