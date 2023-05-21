//
//  SettingsLabel.swift
//  Reciplease
//
//  Created by Zidouni on 20/05/2023.
//

import SwiftUI

struct SettingsLabel: View {
    var text: String
    var icon: String
    @Binding var darkModeEnabled: Bool
    var isLink: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(icon)
                .foregroundColor(.primaryColor)
            
            Text(text)
                .foregroundColor(.primaryColor)
                .font(.defaultLabelCaption)
                
            Spacer()
            
            if isLink {
                Image("link")
                    .foregroundColor(.tabBarIcon)
            } else {
                Toggle(isOn: $darkModeEnabled) {
                }
                .onChange(of: darkModeEnabled, perform: { _ in
                    ThemeManager.shared.handleTheme(darkMode: darkModeEnabled)
                })
                .toggleStyle(SwitchToggleStyle(tint: .tabBarIconSelected))
                .frame(width: 57)
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, minHeight: 70)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 15, style: .continuous))

    }
}

struct SettingsLabel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabel(text: "Enable notifications", icon: "bell", darkModeEnabled: .constant(false), isLink: false)
    }
}
