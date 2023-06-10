//
//  AboutUsView.swift
//  Reciplease
//
//  Created by Zidouni on 10/06/2023.
//

import SwiftUI
import WrappingHStack

struct AboutUsView: View {
    
    @State private var caption = "My resume"
    @State private var showBackgroundHello = false
    @State private var showBackgroundSkills = false
    @State private var showBackgroundSocial = false
    
    @State private var technos = Technos.allCases

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Hello everyone !")
                        .font(.defaultTitle)
                        .foregroundColor(.primaryColor)
                        .background(
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .frame(width: .infinity ,height: 10)
                                    .padding(.top, 5)
                                    .foregroundColor(.secondaryColor)
                                    .onAppear{
                                        withAnimation(.easeInOut(duration: 0.5)) {
                                            showBackgroundHello = true
                                        }
                                        
                                    }
                            }
                        )
                        .padding(.top, 10)
                        .frame(maxWidth: showBackgroundHello ? .infinity : 0 ,maxHeight: 20, alignment: .leading)
                    
                    Text("I'm Naïm a french iOS developper and designer.")
                        .font(.defaultBody)
                        .foregroundColor(.primaryColor)
                }
                .padding(.bottom, 20)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 25) {
                    Text("App techno")
                        .font(.defaultTitle)
                        .foregroundColor(.primaryColor)
                        .background(
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .frame(width: .infinity ,height: 10)
                                    .padding(.top, 5)
                                    .foregroundColor(.secondaryColor)
                                    .onAppear{
                                        withAnimation(.easeInOut(duration: 1)) {
                                            showBackgroundSkills = true
                                        }
                                        
                                    }
                            }
                        )
                        .padding(.top, 10)
                        .frame(maxWidth: showBackgroundSkills ? .infinity : 0 ,maxHeight: 20, alignment: .leading)
                    
                    WrappingHStack(technos, id: \.self, spacing: .constant(10), lineSpacing: 8) { techno in
                        TechnosLabel(techno: techno.rawValue)
                        
                    }
                }
                .padding(.bottom, 20)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("App description")
                        .font(.defaultTitle)
                        .foregroundColor(.primaryColor)
                        .background(
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .frame(width: .infinity ,height: 10)
                                    .padding(.top, 5)
                                    .foregroundColor(.secondaryColor)
                                    .onAppear{
                                        withAnimation(.easeInOut(duration: 1.5)) {
                                            showBackgroundSocial = true
                                        }
                                        
                                    }
                            }
                        )
                        .padding(.top, 10)
                        .frame(maxWidth: showBackgroundSocial ? .infinity : 0 ,maxHeight: 20, alignment: .leading)
                    
                }
                .padding(.bottom, 20)
                
                
                Text("""
                     The essential application for discovering and saving your favourite recipes.
                     Create your shopping lists with missing ingredients.
                     Enhance your cooking experience with Reciplease!
                     """)
                    .font(.defaultBody)
                    .foregroundColor(.primaryColor)
               
                Spacer()
    
            }
            HStack(alignment: .center, spacing: 50) {
                Image("envelope")
                    .resizable()
                    .foregroundColor(.primaryColor)
                    .frame(width: 30, height: 30)
                
                Image("linkedin")
                    .resizable()
                    .foregroundColor(.primaryColor)
                    .frame(width: 30, height: 30)
                
                Image("github")
                    .resizable()
                    .foregroundColor(.primaryColor)
                    .frame(width: 25, height: 25)
                
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.background)
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
