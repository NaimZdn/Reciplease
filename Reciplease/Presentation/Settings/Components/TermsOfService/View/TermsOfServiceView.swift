//
//  TermsOfServiceView.swift
//  Reciplease
//
//  Created by Zidouni on 10/06/2023.
//

import SwiftUI

struct TermsOfServiceView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var lastUpdated = "10.06.2023"
    @State private var terms = Term.allCases
    @State private var showBackground = false
    
    var body: some View {
        if #available(iOS 16.0, *) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    SectionTitle(showBackground: $showBackground, title: "Terms of Service", duration: 0.5)
                    
                    Text("Last updated : \(lastUpdated)")
                        .font(.defaultLabelCaption)
                        .foregroundColor(.primaryColor)
                        .padding(.bottom, 10)
                    
                    Text("""
Please read these Terms carefully before using our mobile application Reciplease operated by NaimZdn.

Your access to and use of the App is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users, and others who access or use the App.

By accessing or using the App, you agree to be bound by these Terms. If you disagree with any part of the Terms, then you may not access the App.
""")
                    .font(.defaultBody)
                    .foregroundColor(.primaryColor)
                    .padding(.bottom, 10)
                    
                    Divider()
                    
                    ForEach(terms.indices, id: \.self) { index in
                        let term = terms[index]
                        TermsSection(title: term.rawValue, content: term.content)
                        
                        if index != terms.indices.last {
                            Divider()
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: OptionButton(icon: "caret-left", action: {
                self.presentationMode.wrappedValue.dismiss()
            }).padding(.top, 25))
            .padding(.horizontal, 20)
            .padding(.vertical, 30)
            .background(Color.background)
            
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    SectionTitle(showBackground: $showBackground, title: "Terms of Service", duration: 0.5)
                    
                    Text("Last updated : \(lastUpdated)")
                        .font(.defaultLabelCaption)
                        .foregroundColor(.primaryColor)
                        .padding(.bottom, 10)
                    
                    Text("""
Please read these Terms carefully before using our mobile application Reciplease operated by NaimZdn.

Your access to and use of the App is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users, and others who access or use the App.

By accessing or using the App, you agree to be bound by these Terms. If you disagree with any part of the Terms, then you may not access the App.
""")
                    .font(.defaultBody)
                    .foregroundColor(.primaryColor)
                    .padding(.bottom, 10)
                    
                    Divider()
                    
                    ForEach(terms.indices, id: \.self) { index in
                        let term = terms[index]
                        TermsSection(title: term.rawValue, content: term.content)
                        
                        if index != terms.indices.last {
                            Divider()
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: OptionButton(icon: "caret-left", action: {
                self.presentationMode.wrappedValue.dismiss()
            }).padding(.top, 25))
            .padding(.horizontal, 20)
            .padding(.top, 1)
            .background(Color.background)

        }
    }
}

struct TermsOfService_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView()
    }
}
