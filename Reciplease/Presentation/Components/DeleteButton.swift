//
//  DeleteButton.swift
//  Reciplease
//
//  Created by Zidouni on 03/06/2023.
//

import SwiftUI

struct DeleteButton: View {
    var action: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                action()
            }) {
                HStack(spacing: 15) {
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 12, height: 12)
                        .padding(.bottom, -2)
                    
                    Text("Delete selections")
                        .font(.defaultLabelCaption)
                        .foregroundColor(Color.background)
                       
            
                }
                .frame(maxWidth: .infinity, minHeight: 55)
                .background(Color.primaryColor, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 20)
            
        }
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton(action: {})
    }
}
