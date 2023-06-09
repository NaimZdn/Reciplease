//
//  OptionButton.swift
//  Reciplease
//
//  Created by Zidouni on 11/05/2023.
//

import SwiftUI

struct OptionButton: View {
    var icon: String
    var action: () -> Void
    
    var body: some View {
        
        Button {
            action()
        } label: {
            Image(icon)
                .foregroundColor(.primaryColor)
                .frame(maxWidth: 37, maxHeight: 37)
                .background(Color.clear, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primaryColor, lineWidth: 2 )
                )
        }
        .frame(minWidth: 37, minHeight: 37)
        .buttonStyle(PlainButtonStyle())    
    }
}

struct OptionButton_Previews: PreviewProvider {
    static var previews: some View {
        OptionButton(icon: "filter", action: {})
    }
}
