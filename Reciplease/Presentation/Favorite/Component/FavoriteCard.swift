//
//  FavoriteCard.swift
//  Reciplease
//
//  Created by Zidouni on 27/05/2023.
//

import SwiftUI

struct FavoriteCard: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("ramen")
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 90)
                .cornerRadius(5)
                .clipped()
                .padding(.bottom, 10)
            
            Text("Chicken Ramen")
                .font(.cardValue)
                .foregroundColor(.cardTitleIcon)
                .padding(.bottom, 10)
            
            CardOption(optionIcon: "timer", optionText: .constant("25 min"))
                .padding(.bottom, 5)
            
            Spacer()
            
            CardOption(optionIcon: "tablewar", optionText: .constant("1 ppl"))
                .padding(.bottom, 5)
            
            CardOption(optionIcon: "kcal", optionText: .constant("412 kcal"))
            
        }
        .padding(10)
        .frame(maxWidth: 169, maxHeight: 230)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct FavoriteCard_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCard()
        
    }
}
