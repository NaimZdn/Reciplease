//
//  SettingsView.swift
//  Reciplease
//
//  Created by Zidouni on 20/05/2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var icon = "bell"
    @State private var text = "Enable notifications"
    @Binding var darkModeIsEnabled: Bool
    
    var body: some View {
        SettingsLabel(text: $text, icon: $icon, darkModeEnabled: $darkModeIsEnabled)
    }
}

struct SeetingsView_Previews: PreviewProvider {
    @State static private var darkMode = true
    
    static var previews: some View {
        SettingsView(darkModeIsEnabled: .constant(false))
    }
}
