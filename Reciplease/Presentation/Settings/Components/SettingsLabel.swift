//
//  SettingsLabel.swift
//  Reciplease
//
//  Created by Zidouni on 20/05/2023.
//

import SwiftUI

struct SettingsLabel: View {
    @EnvironmentObject private var appSettings: AppSettings
    
    @StateObject private var viewModel: SettingsViewModel
    
    var text: String
    var icon: String
    var isNavigation: Bool
    var darkModeToggle: Bool
    var notificationToggle: Bool
    
    
    init(appSettings: AppSettings, text: String, icon: String, isNavigation: Bool, darkModeToggle: Bool, notificationToggle: Bool) {

        self.text = text
        self.icon = icon
        self.isNavigation = isNavigation
        self.darkModeToggle = darkModeToggle
        self.notificationToggle = notificationToggle
        
        self._viewModel = StateObject(wrappedValue: SettingsViewModel(appSettings: appSettings))
               
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Image(icon)
                .foregroundColor(.primaryColor)
            
            Text(text)
                .foregroundColor(.primaryColor)
                .font(.defaultLabelCaption)
            
            Spacer()
            
            if isNavigation {
                Image("caret-right")
                    .resizable()
                    .foregroundColor(.tabBarIcon)
                    .frame(width: 30, height: 30)
                
            }
            
            if darkModeToggle {
                Toggle(isOn: $appSettings.darkModeEnabled) {
                }
                .onChange(of: appSettings.darkModeEnabled, perform: { _ in
                    ThemeManager.shared.handleTheme(darkMode: appSettings.darkModeEnabled)
                })
                .toggleStyle(SwitchToggleStyle(tint: .tabBarIconSelected))
                .frame(width: 57)
            }
            
            if notificationToggle {
                Toggle(isOn: $viewModel.isNotificationEnabled) {
                }
                .onChange(of: viewModel.isNotificationEnabled) { enabled in
                    if enabled {
                        viewModel.openAppSettings()
                    } else {
                        viewModel.disabledNotification()
                    }
                }
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
    @StateObject private static var appSettings = AppSettings()
    
    static var previews: some View {
        SettingsLabel(appSettings: appSettings, text: "Enable notifications", icon: "bell", isNavigation: true, darkModeToggle: false, notificationToggle: false)
            .environmentObject(appSettings)
    }
}
