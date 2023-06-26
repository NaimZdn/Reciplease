//
//  DishView.swift
//  Reciplease
//
//  Created by Zidouni on 19/06/2023.
//

import SwiftUI

struct DishView: View {
    @Environment(\.openURL) var openURL
    
    var cartViewModel: CartViewModel
    var recipeViewModel: RecipeViewModel
    
    var title: String
    var image: URL
    var stepsLink: String
    var timer: String
    var tablewar: String
    var kcalText: String
    var protein: String
    var fat: String
    var carb: String
    var ingredients: [IngredientsResponse]
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                ImageView(imageURL: image)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .clipped()
                    .overlay {
                        HStack {
                            Button {
                                openURL(URL(string: stepsLink)!)
                            } label: {
                                Text("Follow the steps")
                                    .font(.defaultBody)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: 170, maxHeight: 40)
                                    .padding(.horizontal, 20)
                                    .background(Color.cardFavoriteLabel, in: RoundedRectangle(cornerRadius: 7))
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.top, 100)
                    }
                
                VStack {
                    
                }
                .background(Color.background)
                
            }
            VStack {
                HStack {
                    Text(title)
                        .font(.defaultTitle)
                        .foregroundColor(.primaryColor)
                    
                    Spacer()
                    
                    DishFavoriteButton()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 10) {
                    if timer != "0" {
                        CardOption(optionText: "\(timer) min", optionIcon: "timer")
                            .padding(.vertical, 5)
                            .padding(.horizontal, 7)
                            .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
                    }
                    
                    CardOption(optionText: tablewar, optionIcon: "tablewar")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
                    
                    CardOption(optionText: kcalText, optionIcon: "kcal")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView {
                    HStack(spacing: 25) {
                        NutrimentLabel(nutrimentColor: .nutrimentProtein, title: "Protein", value: "\(protein) g")
                        NutrimentLabel(nutrimentColor: .nutrimentFat, title: "Fat", value: "\(fat) g")
                        NutrimentLabel(nutrimentColor: .nutrimentCarb, title: "Carb", value: "\(carb) g")
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 25)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Text("Ingredients")
                            .font(.defaultTitle2)
                            .foregroundColor(.primaryColor)
                        
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(ingredients.indices, id: \.self) { index in
                            let ingredient = ingredients[index]
                            
                            let ingredientIcon = recipeViewModel.displayIngredientIcon(ingredientsApp: cartViewModel.ingredients, ingredientsResponse: ingredients)
                            
                            let iconValue = recipeViewModel.getMatchingIcon(ingredientIcon, ingredient: ingredient.text)
                            
                            IngredientList(ingredient: iconValue, quantity: ingredient.text)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
            .background(Color.background, in: RoundedRectangle(cornerRadius: 35, style: .continuous))
            .padding(.top, -100)
        }
        .ignoresSafeArea()
    }
}

struct DishView_Previews: PreviewProvider {
    @State static private var imageURL = URL(string: "https://edamam-product-images.s3.amazonaws.com/web-img/873/873d09161f6847aadd22f8c17f3b9e01.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHsaCXVzLWVhc3QtMSJHMEUCIQDamt%2B50ojX9ESwJLKPaL1IYFKkqFwfNWXZbrYP3xrZ8QIgeRZaXdjPsE6tWurk70z2dkQ5y8aVHRfCQIpq5Um6b7MqwQUI1P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDNtEOBGBYrmnYpryEyqVBY108K0uBjAKkf5dnddluFcptOUXe5Oz5OZs1mrsy3asRCraDRnN2eysgJCV5Zu1iOpWhjagraIL3IkNkrLfdD2OPLWynPXPjaPkOQcny75%2FyEkukVE5ezHQgcilde7yzCEhLEsuiRfC9qtL7vKz54jvp00XG%2BHwi8GFiOxWF60%2FcjHpxwr%2ByOUkCIjFe64QJmuFM%2FhKe5feduuzXeQ2ptjF%2FwMRMiPAiD4sq4jFRKKi63oAc4ThOVDQ1JzbrMrA3zfdayV9MtpwXubB2PZZeJy2O2LLPpEEz4qUqQSGOgxwx0uJ46MFDsLjLRASlBaA508HfPGRH5kUlvhVCPg3DClR3fqW63COTFR0ZgmDDxnncOlNc99lBT6fPRqU8OGhLq4sJH225KRhD27kbBitwbyx7JeJ3Trp%2FOU1ExS3frxsFFq8LKsgSI3RDzZD8eD6RCKwVHGMMGRLVYq%2BVWf9CMcRYXnfG6bgmKBFCCA4E0HjSexptdhm6zdPGTb0olWKqqJqkaOqmCqxyGsJ1ye5bzOhVFIPJuhKZ4tmZbEkStA2h1E1q3caAq1T0PiauGQkUoou5Umt%2Bz07MJ%2Bs%2FGZEcaVG6PccEJ8LAggTmbiWVuR74lXUv9epd1b6PhFs%2FP4aG47sBgASnUBBgE7op1EK8lv8CoGBvoTxiuixeENSuh5KqtHdrBsR5lrycnMD3qkvjJ7dd4A49NYmqNEOY2hJZScVSVxyCLGmmoLJMRQu1tUpye8vwqqrNbyW0k23vOuSNoObia%2FxsNqe9gjH5HPf8Qb4HdBIGiEIcrHaG%2BnT%2B%2FG9LFfFEK5dXvI8uy9T%2BHb7WyBorJbQ3kI0YDKNCs11Xec2MeN7oyH%2BLCoJwqeimIqCWV2CZXsw8cjQpAY6sQFDnEESrFe%2Bs8ojTk3xRd3h3Is%2FgBSIneanbgWyynHQvbLXyigF2uqDbrenjBh%2FENvgZlzJP5D5zQfiQXM07ZrKunqB3RXWJcI3cxj3XA9doWytFYj2lfmET0IGPChrt06%2BXv8nw3jjlidhY3MOM0E04SCyz3vcsJM37DkhAJJpJQzXDnXjakNu3Dj4HjODUkjf6V%2B9K2XZWrR3aPhLaK60g47lxVnrsXvbjGcM19AebCc%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230622T110702Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFPCDFMDYB%2F20230622%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=9097fc6b98f61131cdf83b1e00a8e4863d59c862780a9d90118043a889bfcc46")!
    
    static var previews: some View {
        DishView(cartViewModel: CartViewModel(),
                 recipeViewModel: RecipeViewModel(),
                 title: "Chicken ramen",
                 image: imageURL,
                 stepsLink: "",
                 timer: "14",
                 tablewar: "1 person",
                 kcalText: "264",
                 protein: "36",
                 fat: "56",
                 carb: "25",
                 ingredients: [])
    }
}
