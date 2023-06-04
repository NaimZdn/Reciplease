//
//  Filters.swift
//  Reciplease
//
//  Created by Zidouni on 02/06/2023.
//

import Foundation

enum FiltersCategories: String, CaseIterable {
    case vegetable
    case meet
    case fish
    case others
    
}

enum FiltersTypes: String, CaseIterable {
    case created = "Created products"
    case application = "Application products"
}

enum FiltersOrder: String, CaseIterable {
    case ascending
    case descending
    case newest
    case oldest
    
}
