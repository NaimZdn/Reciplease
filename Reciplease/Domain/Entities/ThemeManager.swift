//
//  ThemeManager.swift
//  Reciplease
//
//  Created by Zidouni on 10/05/2023.
//

import Foundation
import UIKit

class ThemeManager {
    static let shared = ThemeManager()
    
    func handleTheme(darkMode: Bool) {
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light

    }
}
