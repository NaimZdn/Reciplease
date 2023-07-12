//
//  AboutUsView.swift
//  Reciplease
//
//  Created by Zidouni on 10/06/2023.
//

import SwiftUI
import WrappingHStack

struct AboutUsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var caption = "My resume"
    @State private var showBackgroundHello = false
    @State private var showBackgroundTechno = false
    @State private var showBackgroundSocial = false
    @State private var technos = Techno.allCases
    @State var showGithub = false
    @State var showLinkedin = false
    
    var body: some View {
        if #available(iOS 16.0, *) {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        SectionTitle(showBackground: $showBackgroundHello, title: "Hello everyone !", duration: 0.5)
                        
                        Text("I'm Naïm a french iOS developper and designer.")
                            .font(.defaultBody)
                            .foregroundColor(.primaryColor)
                    }
                    .padding(.bottom, 20)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 25) {
                        SectionTitle(showBackground: $showBackgroundTechno, title: "App technos", duration: 1)
                            .padding(.top, 10)
                        
                        WrappingHStack(technos, id: \.self, spacing: .constant(10), lineSpacing: 8) { techno in
                            TechnosLabel(techno: techno.rawValue)
                            
                        }
                    }
                    .padding(.bottom, 20)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        SectionTitle(showBackground: $showBackgroundSocial, title: "App description", duration: 1.5)
                            .padding(.top, 10)
                        
                        Text("""
                     The essential application for discovering and saving your favourite recipes.
                     Create your shopping lists with missing ingredients.
                     Enhance your cooking experience with Reciplease!
                     """)
                        .font(.defaultBody)
                        .foregroundColor(.primaryColor)
                        
                    }
                    .padding(.bottom, 20)
                    
                    Spacer()
                    
                }
                HStack(alignment: .center, spacing: 50) {
                    
                    LinkButton(isPresented: $showLinkedin, icon: Link.linkedin.rawValue, link: Link.linkedin.link)
                    
                    LinkButton(isPresented: $showGithub, icon: Link.github.rawValue, link: Link.github.link)
                }
                .padding(.vertical, 20)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: OptionButton(icon: "caret-left", action: {
                self.presentationMode.wrappedValue.dismiss()
            }).padding(.top, 25))
            .padding(.horizontal, 20)
            .padding(.top, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.background)
        }
        else {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        SectionTitle(showBackground: $showBackgroundHello, title: "Hello everyone !", duration: 0.5)
                        
                        Text("I'm Naïm a french iOS developper and designer.")
                            .font(.defaultBody)
                            .foregroundColor(.primaryColor)
                    }
                    .padding(.bottom, 20)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 25) {
                        SectionTitle(showBackground: $showBackgroundTechno, title: "App technos", duration: 1)
                            .padding(.top, 10)
                        
                        WrappingHStack(technos, id: \.self, spacing: .constant(10), lineSpacing: 8) { techno in
                            TechnosLabel(techno: techno.rawValue)
                            
                        }
                    }
                    .padding(.bottom, 20)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        SectionTitle(showBackground: $showBackgroundSocial, title: "App description", duration: 1.5)
                            .padding(.top, 10)
                        
                        Text("""
                      The essential application for discovering and saving your favourite recipes.
                      Create your shopping lists with missing ingredients.
                      Enhance your cooking experience with Reciplease!
                      """)
                        .font(.defaultBody)
                        .foregroundColor(.primaryColor)
                        
                    }
                    .padding(.bottom, 20)
                    
                    Spacer()
                    
                }
                HStack(alignment: .center, spacing: 50) {
                    
                    LinkButton(isPresented: $showLinkedin, icon: Link.linkedin.rawValue, link: Link.linkedin.link)
                    
                    LinkButton(isPresented: $showGithub, icon: Link.github.rawValue, link: Link.github.link)
                }
                .padding(.vertical, 20)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: OptionButton(icon: "caret-left", action: {
                self.presentationMode.wrappedValue.dismiss()
            }).padding(.top, 25))
            .padding(.horizontal, 20)
            .padding(.top, 1)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.background)
        }
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
