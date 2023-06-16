//
//  Style.swift
//  Reciplease
//
//  Created by Zidouni on 10/05/2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static let primaryColor = Color("primaryColor")
    static let secondaryColor = Color("secondaryColor")
    static let background = Color("background")
    static let tabBarIcon = Color("tabBarIcon")
    static let tabBarIconSelected = Color("tabBarIconSelected")
    static let placeholder = Color("placeholder")
    static let cardTitleIcon = Color("cardTitleIcon")
    static let labelBackground = Color("labelBackground")
    static let labelBody = Color("labelBody")
    static let titleBackground = Color("titleBackground")
    static let cardFavoriteLabel = Color("cardFavoriteLabel")
    static let selectorStroke = Color("selectorStroke")
    static let selectorBackground = Color("selectorBackground")
    static let addIngredientIcon = Color("addIngredientIcon")
    static let cardBackground = Color("cardBackground")
    static let cardOptionText = Color("cardOptionText")
    static let nutrimentProtein = Color("nutrimentProtein")
    static let nutrimentFat = Color("nutrimentFat")
    static let nutrimentCarb = Color("nutrimentCarb")
    static let ingredientChecked = Color("ingredientChecked")
}

extension Font {
    
    static func fontLight(_ size: CGFloat) -> Font {
        Font.custom("WorkSans-Light", size: size)
    }
    
    static func fontRegular(_ size: CGFloat) -> Font {
        Font.custom("WorkSans-Regular", size: size)
    }
    
    static func fontMedium(_ size: CGFloat) -> Font {
        Font.custom("WorkSans-Medium", size: size)
    }
    
    static func fontSemiBold(_ size: CGFloat) -> Font {
        Font.custom("WorkSans-SemiBold", size: size)
    }
    
    // MARK: - Default
    
    static var defaultOption = fontLight(13)
    static var defaultPlaceholder = fontRegular(14)
    static var defaultLabelCaption = fontRegular(15)
    static var defaultCartLabel = fontMedium(15)
    static var defaultBody = fontRegular(17)
    static var defaultTitle2 = fontMedium(20)
    static var defaultTitle3 = fontSemiBold(25)
    static var defaultButtonCaption = fontSemiBold(20)
    static var defaultTitle = fontSemiBold(30)
    
    // MARK: - Card
    
    static var cardOption = fontLight(13)
    static var cardValue = fontMedium(16)
    
    // MARK: - Nutriment Label
    
    static var nutrimentTitle = fontMedium(14)
    static var nutrimentValue = fontMedium(17)
}
