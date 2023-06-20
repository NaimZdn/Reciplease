//
//  DishView.swift
//  Reciplease
//
//  Created by Zidouni on 19/06/2023.
//

import SwiftUI

struct DishView: View {
    @Binding var timer: String
    @Binding var tablewar: String
    @Binding var kcal: String
    
    var name: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Image("ramen")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .clipped()
                    .overlay {
                        HStack {
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image("caret-left")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 13, height: 17)
  
                                }
                                .frame(width: 50, height: 50)
                                .background(Color.cardFavoriteLabel, in: RoundedRectangle(cornerRadius: 7))
                                .buttonStyle(.plain)
                                
                            }
                            Spacer()
                            
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image("rules")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 25, height: 24)
                                }
                                
                                .frame(width: 50, height: 50)
                                .background(Color.cardFavoriteLabel, in: RoundedRectangle(cornerRadius: 7))
                                
                                .buttonStyle(.plain)
                                
                            }
                            
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 50)
                    }
                
                VStack {
                    
                }
                .background(Color.background)
                
            }
            
            VStack {
                HStack {
                    Text(name)
                        .font(.defaultTitle)
                        .foregroundColor(.primaryColor)
                    
                    Spacer()
                    
                    DishFavoriteButton()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                    
                HStack(spacing: 10) {
                    CardOption(optionText: $timer, optionIcon: "timer")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
                    
                    CardOption(optionText: $tablewar, optionIcon: "tablewar")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
                    
                    CardOption(optionText: $kcal, optionIcon: "kcal")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                    
                
                HStack(spacing: 25) {
                    NutrimentLabel(nutrimentColor: .nutrimentProtein, title: "Protein", value: "36g")
                    NutrimentLabel(nutrimentColor: .nutrimentFat, title: "Fat", value: "56g")
                    NutrimentLabel(nutrimentColor: .nutrimentCarb, title: "Carb", value: "25g")
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("Ingredients")
                        .font(.defaultTitle2)
                        .foregroundColor(.primaryColor)
                    
                    Button {
                        
                    } label: {
                        Text("Copy the list")
                            .font(.defaultOption)
                            .foregroundColor(.primaryColor)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color.clear, in: RoundedRectangle(cornerRadius: 5, style:.continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primaryColor, lineWidth: 1 )
                            )
                    }
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 10) {
                    ScrollView(showsIndicators: false) {
                        IngredientList(ingredient: .constant("🐓"), quantity: .constant("100g Chicken escalope"))
                        IngredientList(ingredient: .constant("🐓"), quantity: .constant("100g Chicken escalope"))
                        IngredientList(ingredient: .constant("🐓"), quantity: .constant("100g Chicken escalope"))
                        IngredientList(ingredient: .constant("🐓"), quantity: .constant("100g Chicken escalope"))
                        IngredientList(ingredient: .constant("🐓"), quantity: .constant("100g Chicken escalope"))
                    }
                  
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color.background, in: RoundedRectangle(cornerRadius: 35, style: .continuous))
            .padding(.top, -100)
        }
        .ignoresSafeArea()
    }

}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView(timer: .constant("14 min"), tablewar: .constant("1 person"), kcal: .constant("234 kcal"), name: "Chicken Ramen")
    }
}
