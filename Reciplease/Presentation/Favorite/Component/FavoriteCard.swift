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
            ZStack(alignment: .topTrailing){
                Image("ramen")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 90)
                    .cornerRadius(5)
                    .clipped()
                    .padding(.bottom, 10)
                
                FavoriteCardButton()
                    .padding(5)
                
            }
            
            Text("Chicken Ramen")
                .font(.cardValue)
                .foregroundColor(.cardTitleIcon)
                .padding(.bottom, 10)
            
            CardOption(optionText: "25 min", optionIcon: "timer")
                .padding(.bottom, 5)
            
            Spacer()
            
            CardOption(optionText: "1 ppl", optionIcon: "tablewar")
                .padding(.bottom, 5)
            
            CardOption(optionText: "412 kcal", optionIcon: "kcal")
            
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
        .frame(maxWidth: 169, maxHeight: 230)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct FavoriteCard_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCard()
        
    }
}
