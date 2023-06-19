//
//  PopUpMessage.swift
//  Reciplease
//
//  Created by Zidouni on 18/06/2023.
//

import SwiftUI

struct PopUpMessage: View {
    var message: String
    var isSuccess: Bool
    
    var body: some View {
        
        HStack(spacing: 20) {
            Image(systemName: isSuccess ? "checkmark.circle": "xmark.circle")
                .foregroundColor(.white)
                .font(.defaultTitle3)
            
            Text(message)
                .font(.defaultBody)
                .foregroundColor(.white)
            
            
            
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: 70, alignment: .leading)
        .background(isSuccess ? Color.green : Color.popUpError, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}

struct PopUpMessage_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMessage(message: "You're created a new ingredient !", isSuccess: true)
    }
}
