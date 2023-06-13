//
//  LinkButton.swift
//  Reciplease
//
//  Created by Zidouni on 11/06/2023.
//

import SwiftUI

struct LinkButton: View {
    @Binding var isPresented: Bool
    
    var icon: String
    var link: String
    
    var body: some View {
        Button {
            self.isPresented.toggle()
        } label: {
            Image(icon)
                .resizable()
                .foregroundColor(.primaryColor)
                .frame(width: 30, height: 30)
        }
        .sheet(isPresented: $isPresented) {
            SafariRepresentable(url: link)
        }
    }
}

struct LinkButton_Previews: PreviewProvider {
    static var previews: some View {
        LinkButton(isPresented: .constant(false), icon: "linkedin", link: "https://www.linkedin.com/in/naim-zidouni/")
    }
}
