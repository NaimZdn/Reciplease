//
//  CartView.swift
//  Reciplease
//
//  Created by Zidouni on 11/05/2023.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: CartViewModel
    @ObservedObject var favoriteViewModel: FavoriteViewModel
    @ObservedObject var dataController =  DataController.shared
    @Binding var isRecipeViewActive: Bool
    
    @State private var searchText = ""
    @State private var showCart = false
    @State private var showAddIngredient = false
    @State private var isHeaderVisible = false
    @State private var isButtonVisible = false
    @State private var visibleIndices: [Int] = []
    @State private var caption = "Find recipe"
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("What's in your fridge ?")
                        .font(.defaultTitle)
                        .foregroundColor(Color.primaryColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 15) {
                        CustomTextField(text: $searchText, placeholder: "Search a product", charactersLimit: 12, size: 240, charactersCounter: false)
                        
                        OptionButton(icon: "plus") {
                            showAddIngredient = true
                        }
                        .sheet(isPresented: $showAddIngredient) {
                            CreateIngredientView(viewModel: viewModel)
                                .presentationDetents([.large, .fraction(0.7)])
                                .presentationDragIndicator(.visible)
                            
                        }
                        ZStack {
                            OptionButton(icon: "cart-outline") {
                                showCart = true
                            }
                            .padding(.trailing, 5)
                            .sheet(isPresented: $showCart) {
                                CartModalView(viewModel: viewModel)
                                    .presentationDetents([.large, .fraction(0.85)])
                                    .presentationDragIndicator(.visible)
                                
                            }
                            
                            Text("\($viewModel.ingredientsSelected.count)")
                                .font(.defaultCartLabel)
                                .foregroundColor(Color.white)
                                .background(Color.secondaryColor
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .mask(
                                        Capsule()
                                            .fill()
                                            .frame(minWidth: 20, minHeight: 20, alignment: .center)
                                    )
                                )
                                .opacity(!$viewModel.ingredientsSelected.isEmpty ? 1 : 0)
                                .padding(.bottom, 35)
                                .padding(.leading, 30)
                            
                        }   
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, isHeaderVisible ? 0 : 50 )
                .opacity(isHeaderVisible ? 1 : 0)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isHeaderVisible = true
                    }
                }
                .padding(.vertical, 10)
                .background(Color.background)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        ForEach(Array(viewModel.ingredients.enumerated().filter { searchText.isEmpty || $0.element.name.lowercased().contains(searchText.lowercased().trimmingCharacters(in: .whitespaces)) }), id: \.element) { (index, ingredient) in
                            
                            let ingredient = viewModel.ingredients[index]
                            let isVisible = visibleIndices.contains(index)
                            
                            IngredientLabel(viewModel: viewModel, ingredientsSelected: $viewModel.ingredientsSelected, isSelected: viewModel.bindingForIngredient(ingredient), ingredientIcon: ingredient.icon, ingredientName: ingredient.name, ingredient: ingredient)
                                .opacity(isVisible ? 1 : 0)
                                .padding(.top, isVisible ? 0 : 20)
                                .onAppear {
                                    if index < 8 && isHeaderVisible {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 * Double(index)) {
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                visibleIndices.append(index)
                                            }
                                        }
                                    } else {
                                        visibleIndices.append(index)
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                }
            }
            .safeAreaInset(edge: .bottom, content: {
                if !$viewModel.ingredientsSelected.isEmpty {
                    NavigationLink(destination: RecipeView(cartViewModel: viewModel, favoriteViewModel: favoriteViewModel).onAppear {isRecipeViewActive = true}.onDisappear { isRecipeViewActive = false }) {
                        Text("Find recipe")
                            .font(.defaultButtonCaption)
                            .foregroundColor(Color.background)
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .background(Color.secondaryColor, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                    .padding(.horizontal, 20)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isButtonVisible = true
                        }
                    }
                    .onDisappear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isButtonVisible = false
                        }
                    }
                    .opacity(isButtonVisible ? 1 : 0)
                    .padding(.bottom, isButtonVisible ? 10 : -50)
                }
            })
            .background(Color.background)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel(), favoriteViewModel: FavoriteViewModel(), isRecipeViewActive: .constant(true))
    }
}

