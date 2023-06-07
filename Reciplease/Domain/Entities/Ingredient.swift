//
//  Ingredient.swift
//  Reciplease
//
//  Created by Zidouni on 11/05/2023.
//

import Foundation

struct Ingredient: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var icon: String
}
