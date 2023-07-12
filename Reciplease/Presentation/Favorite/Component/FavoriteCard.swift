//
//  FavoriteCard.swift
//  Reciplease
//
//  Created by Zidouni on 27/05/2023.
//

import SwiftUI

struct FavoriteCard: View {
    @ObservedObject var favoriteViewModel: FavoriteViewModel
    
    var recipe: Recipe
    var action: () -> Void
    
    var isFavorite: Bool {
        favoriteViewModel.isRecipeFavorite(recipe: recipe)
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                
                ZStack(alignment: .topTrailing){
                    ImageView(imageURL: URL(string: recipe.image)!)
                        .scaledToFill()
                        .frame(width: 140, height: 90)
                        .cornerRadius(5)
                        .clipped()
                        .padding(.bottom, 10)
                    
                    FavoriteCardButton(isFavorite: isFavorite) {
                        favoriteViewModel.toggleFavorite(recipe: recipe)
                        
                    }
                    .padding(5)
                    
                }
                
                Text(recipe.title)
                    .font(.cardValue)
                    .foregroundColor(.cardTitleIcon)
                    .padding(.bottom, 10)
                
                if recipe.timer != "0" {
                    CardOption(optionText: "\(recipe.timer) min", optionIcon: "timer")
                        .padding(.bottom, 5)
                }
                
                Spacer()
                
                CardOption(optionText: "\(recipe.tablewar)", optionIcon: "tablewar")
                    .padding(.bottom, 5)
                
                CardOption(optionText: "\(recipe.kcalText)", optionIcon: "kcal")
                
                
            }
            .accessibilityLabel("Favorite recipe card")
            .accessibilityHint("Click to open the recipe details in a modal view")
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
            .frame(maxWidth: 169, maxHeight: 230)
            .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
            
            
        }
            
    }
}

struct FavoriteCard_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCard(favoriteViewModel: FavoriteViewModel(), recipe: Recipe(title: "Chicken ramen", stepsLink: "", image: "", kcalText: "450", tablewar: "3", timer: "30", protein: "4", fat: "45", carb: "23", ingredients: []), action: {})
        
    }
}
