//
//  RecipeView.swift
//  Reciplease
//
//  Created by Zidouni on 15/06/2023.
//

import SwiftUI
import WrappingHStack

struct RecipeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var recipeViewModel = RecipeViewModel()
    
    @State private var showDish = false
    @State private var selectedHit: Hit? = nil
    
    var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color.background)
                .frame(maxWidth: .infinity, maxHeight: 5)
            
            GeometryReader { geometry in
                ScrollView {
                    if recipeViewModel.isLoading {
                        ProgressView()
                            .frame(width: geometry.size.width)  
                    } else {
                        VStack(spacing: 10) {
                            if recipeViewModel.recipes.isEmpty {
                                VStack(spacing: 10) {
                                    
                                    Image(systemName: "book")
                                        .font(.system(size: 70))
                                        .foregroundColor(Color.primaryColor)
                                    
                                    Text("No recipe found with these ingredients")
                                        .font(.defaultTitle2)
                                        .foregroundColor(.primaryColor)
                                        .multilineTextAlignment(.center)
  
                                }
                                .frame(width: geometry.size.width)
                                .frame(minHeight: geometry.size.height)
                                .opacity(0.6)
                                .ignoresSafeArea()
                                
                            } else {
                                ForEach(recipeViewModel.recipes.indices, id: \.self) { index in
                                    let hit = recipeViewModel.recipes[index]
                                    let dishBinding = Binding(
                                        get: { showDish },
                                        set: { newValue in
                                            if newValue {
                                                selectedHit = hit
                                            }
                                            showDish = newValue
                                        }
                                    )
                                    
                                    RecipeCard(
                                        title: hit.recipe.label,
                                        kcalText: "\(String(format: "%0.f", hit.recipe.calories / hit.recipe.yield )) kcal",
                                        tablewar: "\(String(format: "%0.f", hit.recipe.yield)) \(hit.recipe.yield != 1 ? "ppl" : "prs")",
                                        timer: "\(String(format: "%0.f", hit.recipe.totalTime))",
                                        image: URL(string: hit.recipe.image)!,
                                        action: {
                                            dishBinding.wrappedValue = true
                                        }
                                    )
                                    .sheet(isPresented: dishBinding) {
                                        DishView(
                                            cartViewModel: cartViewModel,
                                            recipeViewModel: recipeViewModel,
                                            title: selectedHit!.recipe.label,
                                            image: URL(string: selectedHit!.recipe.image)!,
                                            stepsLink: selectedHit!.recipe.url,
                                            timer: "\(String(format: "%0.f", selectedHit!.recipe.totalTime))",
                                            tablewar: "\(String(format: "%0.f", selectedHit!.recipe.yield)) \(selectedHit!.recipe.yield != 1 ? "ppl" : "prs")",
                                            kcalText: "\(String(format: "%0.f", selectedHit!.recipe.calories / selectedHit!.recipe.yield )) kcal",
                                            protein: "\(String(format: "%0.f", selectedHit!.recipe.digest[2].total / selectedHit!.recipe.yield))",
                                            fat: "\(String(format: "%0.f", selectedHit!.recipe.digest[0].total / selectedHit!.recipe.yield))",
                                            carb: "\(String(format: "%0.f", selectedHit!.recipe.digest[1].total / selectedHit!.recipe.yield))",
                                            ingredients: selectedHit!.recipe.ingredients
                                        )
                                    }
                                }
                            }
                        }
                        .frame(width: geometry.size.width)
                        .padding(.top, 15)
                    }
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal ) {
                HStack(alignment: .center) {
                    Text(recipeViewModel.recipes.count > 1 ? "Recipes" : "Recipe")
                        .font(.defaultTitle3)
                        .foregroundColor(Color.primaryColor)
                        .multilineTextAlignment(.leading)
                }
                .padding(.top, 30)
                
            }
        }
        .navigationBarItems(leading: OptionButton(icon: "caret-left", action: {
            self.presentationMode.wrappedValue.dismiss()
        }).padding(.top, 30)
            .padding(.leading, 5))
        
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .background(Color.background)
        .onAppear {
            recipeViewModel.fetchRecipe(viewModel: cartViewModel)
        }
        .onChange(of: recipeViewModel.isLoading) { isLoading in
            
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    @EnvironmentObject private var recipeViewModel: RecipeViewModel
    static var previews: some View {
        RecipeView(cartViewModel: CartViewModel())
 
    }
}
