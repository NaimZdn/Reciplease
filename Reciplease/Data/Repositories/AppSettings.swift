//
//  AppSettings.swift
//  Reciplease
//
//  Created by Zidouni on 13/06/2023.
//

import Foundation
import SwiftUI

class AppSettings: ObservableObject {
    @AppStorage("isNotificationEnabled") var isNotificationEnabled = false
    @AppStorage("darkModeEnabled") var darkModeEnabled = false
    
}
