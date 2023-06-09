//
//  FavoriteCardButton.swift
//  Reciplease
//
//  Created by Zidouni on 02/06/2023.
//

import SwiftUI

struct FavoriteCardButton: View {
    var isFavorite: Bool
    var togglefavorite: () -> Void
    
    private var favoriteIcon: String {
        isFavorite ? "favorite" : "favorite-outline"
    }
    
    var body: some View {
        HStack {
            Button {
                togglefavorite()
            } label: {
                Image(favoriteIcon)
                    .resizable()
                    .frame(width: 11, height: 15)
                    .foregroundColor(.white)
            }
            .buttonStyle(.plain)
        }
        .accessibilityAddTraits(.isSelected)
        .accessibilityLabel("Favorite button")
        .accessibilityHint("Click to add/delete the recipe to/from your favorite")
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color.cardFavoriteLabel, in: RoundedRectangle(cornerRadius: 7))
             
    }
}

struct FavoriteCardButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCardButton(isFavorite: true, togglefavorite: {})
    }
}
