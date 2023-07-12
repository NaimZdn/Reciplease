//
//  TabBarView.swift
//  Reciplease
//
//  Created by Zidouni on 12/05/2023.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: TabBar = .cart
    @State private var isRecipeViewActive = false
    @State private var isAboutUsActive = false
    @State private var isPrivacyPolicyActive = false
    @State private var isTermsOfServiceActive = false
    @State private var tabBarOpacity: Double = 1
    
    @ObservedObject private var cartViewModel = CartViewModel()
    @ObservedObject private var favoriteViewModel = FavoriteViewModel()
    
    @EnvironmentObject private var appSettings: AppSettings

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    CartView(viewModel: cartViewModel, favoriteViewModel: favoriteViewModel, isRecipeViewActive: $isRecipeViewActive)
                        .tag(TabBar.cart)
                        .accessibilityAddTraits(.isSelected)
                        .accessibilityLabel("Cart tab bar button")
                    
                    FavoriteView(viewModel: favoriteViewModel)
                        .tag(TabBar.favorite)
                        .accessibilityAddTraits(.isSelected)
                        .accessibilityLabel("Favorite tab bar button")
                    
                    SettingsView(isAboutUsActive: $isAboutUsActive, isPrivacyPolicyActive: $isPrivacyPolicyActive, isTermsOfServiceActive: $isTermsOfServiceActive)
                        .tag(TabBar.seetings)
                        .accessibilityAddTraits(.isSelected)
                        .accessibilityLabel("Settings tab bar button")
                    
                } .overlay {
                    VStack {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            PopUpMessage(message: favoriteViewModel.popUpMessage, isSuccess: favoriteViewModel.popUpStatus)
                                .opacity(favoriteViewModel.showPopUp ? 1 : 0 )
                                .padding(.top, favoriteViewModel.showPopUp ? 0 : -150)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        favoriteViewModel.showPopUp = false
                                    }
                                }
                        }
                        
                        withAnimation(.easeInOut(duration: 0.3)) {
                            PopUpMessage(message: cartViewModel.popUpMessage, isSuccess: cartViewModel.popUpStatus)
                                .opacity(cartViewModel.showPopUp ? 1 : 0 )
                                .padding(.top, cartViewModel.showPopUp ? 0 : -150)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        cartViewModel.showPopUp = false
                                    }
                                }
                        }
                    }
                    .accessibilityLabel("The Tab Bar")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
                
                
            
                if !isAboutUsActive && !isPrivacyPolicyActive && !isTermsOfServiceActive && !isRecipeViewActive{
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
        .onChange(of: isRecipeViewActive, perform: { newValue in
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
