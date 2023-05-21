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
    
    @State private var label = Label.allCases
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Settings")
                .font(.defaultTitle)
                .foregroundColor(.primaryColor)
                .padding(.bottom, 30)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Application settings")
                    .font(.defaultBody)
                    .foregroundColor(.primaryColor)
                    .padding(.bottom, 10)
                
                SettingsLabel(text: label[0].rawValue, icon: label[0].icon, darkModeEnabled: $darkModeIsEnabled, isLink: false)
                
                SettingsLabel(text: label[1].rawValue, icon: label[1].icon, darkModeEnabled: $darkModeIsEnabled, isLink: false)
                 
               
                .padding(.bottom, 30)
                
                Text("Legal mentions")
                    .font(.defaultBody)
                    .foregroundColor(.primaryColor)
                    .padding(.bottom, 10)
                
                SettingsLabel(text: label[2].rawValue, icon: label[2].icon, darkModeEnabled: $darkModeIsEnabled, isLink: true)
                
                SettingsLabel(text: label[3].rawValue, icon: label[3].icon, darkModeEnabled: $darkModeIsEnabled, isLink: true)
                
                SettingsLabel(text: label[4].rawValue, icon: label[4].icon, darkModeEnabled: $darkModeIsEnabled, isLink: true)
                
                SettingsLabel(text: label[5].rawValue, icon: label[5].icon, darkModeEnabled: $darkModeIsEnabled, isLink: true)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.background)

    }
}

struct SeetingsView_Previews: PreviewProvider {
    @State static private var darkMode = true
    
    static var previews: some View {
        SettingsView(darkModeIsEnabled: .constant(false))
    }
}
