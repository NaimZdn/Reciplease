//
//  TermsSection.swift
//  Reciplease
//
//  Created by Zidouni on 10/06/2023.
//

import SwiftUI

struct TermsSection: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.defaultTitle3)
                .foregroundColor(.primaryColor)
            
            Text("\(content)")
           
            .font(.defaultBody)
            .foregroundColor(.primaryColor)
            .padding(.bottom, 10)
        }
    }
}

struct TermsSection_Previews: PreviewProvider {
    static var previews: some View {
        TermsSection(title: "Content", content: "Hello world")
    }
}
