//
//  ValidateButton.swift
//  Reciplease
//
//  Created by Zidouni on 10/05/2023.
//

import SwiftUI

struct ValidateButton: View {
    
    @Binding var buttonCaption: String
    var action: () -> Void
    
    var body: some View {
        
        HStack {
            Button(action: {
                action()
            }) {
                Text(buttonCaption)
                    .font(.defaultButtonCaption)
                    .foregroundColor(Color.background)
                    .frame(maxWidth: .infinity, minHeight: 55)
                    .background(Color.secondaryColor, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                
            }
            .padding(.horizontal, 20)
            
        }
    }
}

struct Button_Previews: PreviewProvider {
    @State static var caption = "Let's start"
    
    static var previews: some View {
        ValidateButton(buttonCaption: $caption, action: {})
    }
}
