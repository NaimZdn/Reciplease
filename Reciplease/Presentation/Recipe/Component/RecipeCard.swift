//
//  RecipeCard.swift
//  Reciplease
//
//  Created by Zidouni on 01/06/2023.
//

import SwiftUI

struct RecipeCard: View {
    @State private var timerText = "25 min"
    @State private var tablewarText = "1 ppl"
    @State private var kcalText = "494 kcal"
    
    var body: some View {
        HStack{
            HStack(alignment: .top) {
                
                Image("ramen")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 94, height: 94)
                    .cornerRadius(5)
                    .clipped()
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Chicken ramen")
                            .font(.cardValue)
                            .foregroundColor(.cardTitleIcon)
                        
                        Spacer()
                        
                        FavoriteButton()
                    }
                    .padding(.leading, 7)
                    
                    HStack {
                        CardOption(optionText: $timerText, optionIcon: "timer")
                    }
                    .padding(.leading, 7)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        CardOption(optionText: $tablewarText, optionIcon: "tablewar")
                        CardOption(optionText: $kcalText, optionIcon: "kcal")
                    }
                }
                .padding(.top, 10)
            }
            .frame(maxWidth: 314, maxHeight: 94)
        }
        .frame(maxWidth: 340, maxHeight: 120)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 10))
        
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            RecipeCard()
        }
        .padding(10)
        .background(Color.background)
    }
}
