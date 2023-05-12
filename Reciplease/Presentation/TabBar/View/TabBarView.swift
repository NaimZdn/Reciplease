//
//  TabBarView.swift
//  Reciplease
//
//  Created by Zidouni on 12/05/2023.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: TabBar = .cart
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {       
                TabView(selection: $selectedTab) {
                    CartView()
                        .tag(TabBar.cart)
                    
                }
                CustomTabBar(selectedTab: $selectedTab)
                    .padding(.bottom, 25)
                    
            }
        }
        .background(Color.background)
        .ignoresSafeArea(.keyboard)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
