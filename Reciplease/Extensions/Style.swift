//
//  Style.swift
//  Reciplease
//
//  Created by Zidouni on 10/05/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = Theme()
    
    init(hex: UInt, alpha: Double = 1) {
           self.init(
               .sRGB    ,
               red: Double((hex >> 16) & 0xff) / 255,
               green: Double((hex >> 08) & 0xff) / 255,
               blue: Double((hex >> 00) & 0xff) / 255,
               opacity: alpha
           )
       }
    
    static var primaryColor: Color {
        theme.isDarkMode ? Color(hex: 0xE3E3E3) : Color(hex: 0x454545)
    }
    
    static var secondaryColor = Color(hex: 0xC5DC91)
    
    static var background: Color {
        theme.isDarkMode ? Color(hex: 0x252427) : Color(hex: 0xF5F3F1)
    }
    
    static var tabBarIcon: Color {
        theme.isDarkMode ? Color(hex: 0xFFFFFF, alpha: 0.2) : Color(hex: 0x000000, alpha: 0.2)
    }
    
    static var placeholder: Color {
        theme.isDarkMode ? Color(hex: 0xFFFFFF, alpha: 0.3) : Color(hex: 0x000000, alpha: 0.3)
    }
    
    static var cardTitleIcon: Color {
        theme.isDarkMode ? Color(hex: 0x000000) : Color(hex: 0xFFFFFF)
    }
    
    static var labelBackground : Color {
        theme.isDarkMode ? Color(hex: 0xFFFFFF, alpha: 0.05) : Color(hex: 0x000000, alpha: 0.05)
    }
    
    static var labelBody : Color {
        theme.isDarkMode ? Color(hex: 0xFFFFFF, alpha: 0.7) : Color(hex: 0x000000, alpha: 0.7)
    }
    
    static var selectorStroke = Color(hex: 0xADC577)
    
    static var selectorBackground = Color(hex: 0xC5DC91, alpha: 0.2)

    static var cardBackground : Color {
        theme.isDarkMode ? Color(hex: 0xFFFFFF) : Color(hex: 0x000000)
    }
    
    static var cardOptionText = Color(hex: 0x454545, alpha: 0.7)
    
    static var nutrimentProtein : Color {
        theme.isDarkMode ? Color(hex: 0x68DE57, alpha: 0.3) : Color(hex: 0x77C969, alpha: 0.2)
    }
    
    static var nutrimentFat : Color {
        theme.isDarkMode ? Color(hex: 0xED8F38, alpha: 0.3) : Color(hex: 0xD48A46, alpha: 0.2)
    }
    
    static var nutrimentCarb : Color {
        theme.isDarkMode ? Color(hex: 0xEE5252, alpha: 0.3) : Color(hex: 0xD44646, alpha: 0.2)
    }
    
    static var ingredientChecked : Color {
        theme.isDarkMode ? Color(hex: 0xFFFFFF, alpha: 0.5) : Color(hex: 0x000000, alpha: 0.5)
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
        fontRegular(15)
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
