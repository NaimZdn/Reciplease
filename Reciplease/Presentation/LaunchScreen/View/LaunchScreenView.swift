//
//  LaunchScreenView.swift
//  Reciplease
//
//  Created by Zidouni on 10/05/2023.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var caption = "Let's start"
    @State private var isLogoVisible = false
    @State private var isMainVisible = false
    @State private var isButtonVisible = false
    
    @State private var showTabBarView = false
    
    var body: some View {
        
        VStack {
            HStack {
                Image("Logo light")
                    .resizable()
                    .frame(width: 167, height: 30)
                    .padding(.top, isLogoVisible ? 20 : -10)
                    .opacity(isLogoVisible ? 1 : 0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.6)){
                            isLogoVisible = true
                        }
                    }
            }
            
            Spacer()
            
            VStack {
                Image("Fridge")
                    .resizable()
                    .frame(maxWidth: 265, maxHeight: 265)
                    .cornerRadius(300)
                    .padding(.bottom, 30)
                
                Text("All recipes based\n on your ingredients")
                    .font(.defaultTitle)
                    .foregroundColor(.primaryColor)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 8)
                
                Text("Finding new ideas has never been easier.")
                    .font(.defaultBody)
                    .foregroundColor(Color.primaryColor)
            }
            .opacity(isMainVisible ? 1 : 0)
            .padding(.bottom, isMainVisible ? 0 : -70)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 0.6)){
                        isMainVisible = true
                    }
                }
            }
            
            Spacer()
            
            ValidateButton(buttonCaption: $caption, action: {
                withAnimation(.easeInOut(duration: 0.6)) {
                    isLogoVisible = false
                    isMainVisible = false
                    isButtonVisible = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    showTabBarView = true
                }
            })
            .opacity(isButtonVisible ? 1 : 0)
            .padding(.bottom, isButtonVisible ? 20 : -70)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeInOut(duration: 0.7)){
                        isButtonVisible = true
                    }
                }
            }
        }
        .background(Color.background)
        .fullScreenCover(isPresented: $showTabBarView) {
            TabBarView()
                
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
