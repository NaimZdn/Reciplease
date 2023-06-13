//
//  SettingsView.swift
//  Reciplease
//
//  Created by Zidouni on 20/05/2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var appSettings: AppSettings

    @State private var icon = "bell"
    @State private var text = "Enable notifications"
    @State private var label = Label.allCases
    
    @Binding var isAboutUsActive: Bool
    @Binding var isPrivacyPolicyActive: Bool
    @Binding var isTermsOfServiceActive: Bool
    
    var body: some View {
        NavigationView {
            
            VStack {
                VStack(alignment: .leading) {
                    Text("Settings")
                        .font(.defaultTitle)
                        .foregroundColor(.primaryColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                }
                .padding(.vertical, 10)
                    
                ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Application settings")
                                .font(.defaultBody)
                                .foregroundColor(.primaryColor)
                                .padding(.bottom, 10)
                            
                            SettingsLabel(appSettings: appSettings, text: label[0].rawValue, icon: label[0].icon, isNavigation: false, darkModeToggle: false, notificationToggle: true)
                            
                            SettingsLabel(appSettings: appSettings, text: label[1].rawValue, icon: label[1].icon, isNavigation: false, darkModeToggle: true, notificationToggle: false)
                            
                                .padding(.bottom, 30)
                            
                            Text("Legal mentions")
                                .font(.defaultBody)
                                .foregroundColor(.primaryColor)
                                .padding(.bottom, 10)
                            
                            NavigationLink(destination: AboutUsView().onAppear{ isAboutUsActive = true }.onDisappear { isAboutUsActive = false }) {
                                SettingsLabel(appSettings: appSettings, text: label[2].rawValue, icon: label[2].icon, isNavigation: true, darkModeToggle: false, notificationToggle: false)
                                
                            }
                            
                            NavigationLink(destination: PrivacyPolicyView().onAppear{ isPrivacyPolicyActive = true }.onDisappear { isPrivacyPolicyActive = false }) {
                                SettingsLabel(appSettings: appSettings, text: label[3].rawValue, icon: label[3].icon, isNavigation: true, darkModeToggle: false, notificationToggle: false)
                                
                            }
                            
                            NavigationLink(destination: TermsOfServiceView().onAppear{ isTermsOfServiceActive = true }.onDisappear { isTermsOfServiceActive = false }) {
                                SettingsLabel(appSettings: appSettings, text: label[4].rawValue, icon: label[4].icon, isNavigation: true, darkModeToggle: false, notificationToggle: false)
                                
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                    }
            }
            .edgesIgnoringSafeArea(.bottom)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.background)
   
        }
    }
}

struct SeetingsView_Previews: PreviewProvider {
    @StateObject private static var appSettings = AppSettings()
    
    @State static private var darkMode = true
    
    static var previews: some View {
        SettingsView(isAboutUsActive: .constant(false), isPrivacyPolicyActive: .constant(false), isTermsOfServiceActive: .constant(false))
            .environmentObject(appSettings)
    }
}
