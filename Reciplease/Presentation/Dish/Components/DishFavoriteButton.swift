//
//  DishFavoriteButton.swift
//  Reciplease
//
//  Created by Zidouni on 19/06/2023.
//

import SwiftUI

struct DishFavoriteButton: View {
    var isFavorite: Bool
    var toggleFavorite: () -> Void
    
    private var favoriteIcon: String {
        isFavorite ? "favorite" : "favorite-outline"
    }
    
    var body: some View {
        HStack {
            Button {
                toggleFavorite()
            } label: {
                Image(favoriteIcon)
                    .resizable()
                    .frame(width: 17, height: 23)
                    .foregroundColor(.primaryColor)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
    }
}

struct DishFavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        DishFavoriteButton(isFavorite: true, toggleFavorite: {})
    }
}
