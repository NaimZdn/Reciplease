//
//  Label.swift
//  Reciplease
//
//  Created by Zidouni on 21/05/2023.
//

import Foundation

enum Label: String, CaseIterable {
    case notification = "Enable notification"
    case colorMode = "Dark mode"
    case rate = "Rate this application"
    case about = "About us"
    case privacy = "Privacy policy"
    case term = "Term of service"
    
    var icon: String {
        switch self {
        case .notification:
            return "bell"
        case .colorMode:
            return "sun"
        case .rate:
            return "star"
        case .about:
            return "question"
        case .privacy:
            return "book"
        case .term:
            return "rules"
        }
    }
}
