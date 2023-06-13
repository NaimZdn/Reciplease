//
//  CustomTabBar.swift
//  Reciplease
//
//  Created by Zidouni on 12/05/2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: TabBar
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                ForEach(TabBar.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image("\(selectedTab == tab ? selectedTab.rawValue : tab.rawValue)")
                        .resizable()
                        .frame(width: tab.rawValue == "favorite" ? 19 : 25, height: 25)
                        .foregroundColor(selectedTab == tab ? .tabBarIconSelected : .tabBarIcon)
                        .onTapGesture {
                            selectedTab = tab
                        }
                    Spacer()
                }
            }
            .padding(.top, 20)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.cart))
            .padding()
            .background(Color.background)
    }
}
