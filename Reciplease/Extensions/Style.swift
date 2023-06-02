//
//  Style.swift
//  Reciplease
//
//  Created by Zidouni on 10/05/2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static var primaryColor: Color {
        Color("primaryColor")
    }
    
    static var secondaryColor = Color("secondaryColor")
    
    static var background: Color {
        Color("background")
    }
    
    static var tabBarIcon: Color {
        Color("tabBarIcon")
    }
    
    static var tabBarIconSelected: Color {
        Color("tabBarIconSelected")
    }
    
    static var placeholder: Color {
        Color("placeholder")
    }
    
    static var cardTitleIcon: Color {
        Color("cardTitleIcon")
    }
    
    static var labelBackground : Color {
        Color("labelBackground")
    }
    
    static var labelBody : Color {
        Color("labelBody")
    }
    
    static var cardFavoriteLabel = Color("cardFavoriteLabel")
    
    static var selectorStroke = Color("selectorStroke")
    
    static var selectorBackground = Color("selectorBackground")
    
    static var cardBackground : Color {
        Color("cardBackground")
    }
    
    static var cardOptionText = Color("cardOptionText")
    
    static var nutrimentProtein : Color {
        Color("nutrimentProtein")
    }
    
    static var nutrimentFat : Color {
        Color("nutrimentFat")
    }
    
    static var nutrimentCarb : Color {
        Color("nutrimentCarb")
    }
    
    static var ingredientChecked : Color {
        Color("ingredientChecked")
    }
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
    
    static var defaultOption: Font {
        fontLight(13)
    }
    
    static var defaultPlaceholder: Font {
        fontRegular(14)
    }
    
    static var defaultLabelCaption: Font {
        fontRegular(15)
    }
    
    static var defaultBody: Font {
        fontRegular(17)
    }
    
    static var defaultButtonCaption: Font {
        fontSemiBold(20)
    }
    
    static var defaultTitle: Font {
        fontSemiBold(30)
    }
    
    // MARK: - Card
    
    static var cardOption: Font {
        fontLight(13)
    }
    
    static var cardValue: Font {
        fontMedium(16)
    }
    
    // MARK: - Nutriment Label
    
    static var nutrimentTitle: Font {
        fontMedium(14)
    }
    
    static var nutrimentValue: Font {
        fontMedium(17)
    }
}
