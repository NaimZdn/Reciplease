//
//  LaunchScreenView.swift
//  Reciplease
//
//  Created by Zidouni on 10/05/2023.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var caption = "Let's start"
    
    var body: some View {
        
        VStack {
            Image("Logo light")
                .resizable()
                .frame(width: 167, height: 30)
                .padding(.top, 30)
            
            Spacer()
            
            Image("Fridge")
                .resizable()
                .frame(maxWidth: 265, maxHeight: 265)
                .cornerRadius(300)
                .padding(.bottom, 50)
            
            Text("All recipes based\n on your ingredients")
                .font(.defaultTitle)
                .foregroundColor(.primaryColor)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            
            Text("Finding new ideas has never been easier.")
                .font(.defaultBody)
                .foregroundColor(Color.primaryColor)
            
            Spacer()
            
            ValidateButton(buttonCaption: $caption)
                .padding(.bottom, 20)
            
        }
        .background(Color.background)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
