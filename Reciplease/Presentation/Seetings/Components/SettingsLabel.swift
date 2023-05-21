//
//  SettingsLabel.swift
//  Reciplease
//
//  Created by Zidouni on 20/05/2023.
//

import SwiftUI

struct SettingsLabel: View {
    @Binding var text: String
    @Binding var icon: String
    @Binding var darkModeEnabled: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(icon)
                .foregroundColor(.primaryColor)
            
            Text(text)
                .foregroundColor(.primaryColor)
                .font(.defaultLabelCaption)
                
            Spacer()
            
            Toggle(isOn: $darkModeEnabled) {
            }
            .onChange(of: darkModeEnabled, perform: { _ in
                ThemeManager.shared.handleTheme(darkMode: darkModeEnabled)
            })
            .toggleStyle(SwitchToggleStyle(tint: .tabBarIconSelected))
            .frame(width: 57)
 
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, minHeight: 70)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
        .padding(20)
        .background(Color.background)
    }
}

struct SettingsLabel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabel(text: .constant("Enable notifications"), icon: .constant("bell"), darkModeEnabled: .constant(false))
    }
}
