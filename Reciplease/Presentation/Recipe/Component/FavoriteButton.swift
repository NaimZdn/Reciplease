//
//  FavoriteButton.swift
//  Reciplease
//
//  Created by Zidouni on 01/06/2023.
//

import SwiftUI

struct FavoriteButton: View {
    @State private var isFavorite = false
    
    private var icon: String {
        isFavorite ? "favorite" : "favorite-outline"
    }
    
    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.1)) {
                isFavorite.toggle()
            }
        } label: {
            Image(icon)
                .resizable()
                .frame(width: 15, height: 20)
                .foregroundColor(isFavorite ? .secondaryColor : .cardTitleIcon)
            
        }
        .buttonStyle(PlainButtonStyle())
        
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton()
    }
}
