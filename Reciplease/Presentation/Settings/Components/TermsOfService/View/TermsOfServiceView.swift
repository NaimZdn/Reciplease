//
//  TermsOfServiceView.swift
//  Reciplease
//
//  Created by Zidouni on 10/06/2023.
//

import SwiftUI

struct TermsOfServiceView: View {
    @State private var lastUpdated = "10.06.2023"
    @State private var terms = Terms.allCases
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Terms of Service")
                    .font(.defaultTitle)
                    .foregroundColor(.primaryColor)
                
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

                ForEach(terms, id: \.self) { term in
                    TermsSection(title: term.rawValue, content: term.content)
    
                }

            }
        }
        .padding(20)
        .background(Color.background)
    }
}

struct TermsOfService_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView()
    }
}
