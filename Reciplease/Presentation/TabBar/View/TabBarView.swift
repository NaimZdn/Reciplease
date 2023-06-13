//
//  TabBarView.swift
//  Reciplease
//
//  Created by Zidouni on 12/05/2023.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: TabBar = .cart
    @State private var isAboutUsActive = false
    @State private var isPrivacyPolicyActive = false
    @State private var isTermsOfServiceActive = false
    @State private var tabBarOpacity: Double = 1
    
    @EnvironmentObject private var appSettings: AppSettings
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    CartView()
                        .tag(TabBar.cart)
                    FavoriteView()
                        .tag(TabBar.favorite)
                    SettingsView(isAboutUsActive: $isAboutUsActive, isPrivacyPolicyActive: $isPrivacyPolicyActive, isTermsOfServiceActive: $isTermsOfServiceActive)
                        .tag(TabBar.seetings)
                    
                }
                
                if !isAboutUsActive && !isPrivacyPolicyActive && !isTermsOfServiceActive {
                    CustomTabBar(selectedTab: $selectedTab)
                        .padding(.bottom, 25)
                        .opacity(tabBarOpacity)

                }
            }
        }
        .onChange(of: isAboutUsActive, perform: { newValue in
            withAnimation(.easeInOut(duration: 0.1)) {
                if newValue {
                    tabBarOpacity = 0
                } else {
                    tabBarOpacity = 1
                }
            }
        })
        .onChange(of: isPrivacyPolicyActive, perform: { newValue in
            withAnimation(.easeInOut(duration: 0.1)) {
                if newValue {
                    tabBarOpacity = 0
                } else {
                    tabBarOpacity = 1
                }
            }
        })
        .onChange(of: isTermsOfServiceActive, perform: { newValue in
            withAnimation(.easeInOut(duration: 0.1)) {
                if newValue {
                    tabBarOpacity = 0
                } else {
                    tabBarOpacity = 1
                }
            }
        })
        .onAppear {
            ThemeManager.shared.handleTheme(darkMode: appSettings.darkModeEnabled)
            
        }
        .background(Color.background)
        .ignoresSafeArea(.keyboard)
    }    
}

struct TabBarView_Previews: PreviewProvider {
    @StateObject private static var appSettings = AppSettings()
    
    static var previews: some View {
        TabBarView()
            .environmentObject(appSettings)
    }
}
