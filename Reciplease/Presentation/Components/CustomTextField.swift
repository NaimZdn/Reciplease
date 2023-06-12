//
//  CustomTextField.swift
//  Reciplease
//
//  Created by Zidouni on 09/06/2023.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var size: CGFloat
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 15) {
            TextField(placeholder, text: $text)
                .font(.defaultPlaceholder)
                .overlay(
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.primaryColor)
                        .padding(.top, 35)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("0/1")
                .font(.defaultLabelCaption)
                .foregroundColor(Color.primaryColor)
            
        }
        .frame(maxWidth: size)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), size: 60, placeholder: "ID")
    }
}
