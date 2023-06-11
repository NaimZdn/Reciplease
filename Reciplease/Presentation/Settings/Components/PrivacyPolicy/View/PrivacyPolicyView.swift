//
//  PrivacyPolicyView.swift
//  Reciplease
//
//  Created by Zidouni on 10/06/2023.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var privacyPolicy = PrivacyPolicy.allCases
    @State private var showBackground = false
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                SectionTitle(showBackground: $showBackground, title: "Privacy Policy", duration: 0.5)
                
                Text("We respect your privacy and are committed to protecting your personal information.\n\nThis Privacy Policy explains how we collect, use, and safeguard your data when you use our app.")
                .font(.defaultBody)
                .foregroundColor(.primaryColor)
                .padding(.bottom, 10)
                
                Divider()

                ForEach(privacyPolicy, id: \.self) { policy in
                    TermsSection(title: policy.rawValue, content: policy.content)
                    Divider()
    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: OptionButton(icon: "carret", action: {
            self.presentationMode.wrappedValue.dismiss()
        }))
        .padding(20)
        .background(Color.background)
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
