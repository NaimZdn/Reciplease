//
//  CartView.swift
//  Reciplease
//
//  Created by Zidouni on 11/05/2023.
//

import SwiftUI

struct CartView: View {
    @State private var searchText = ""
    @State private var showFilters = false
    @State private var isLabelVisible: [Bool] = []
    @State private var isHeaderVisible = false
    
    @State private var ingredientsSearched: [Ingredient] = []
    
    @ObservedObject var viewModel = CartViewModel()
    
    private var isSearchBarEmpty: Bool {
        viewModel.containsOnlySpaces(searchText)
    }
    
    init() {
        _isLabelVisible = State(initialValue: Array(repeating: false, count: viewModel.ingredients.count))
    }
    
    var body: some View {
        
        VStack {
            VStack() {
                Text("What's in your fridge ?")
                    .font(.defaultTitle)
                    .foregroundColor(Color.primaryColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 15) {
                    TextField("Search for a product", text: $searchText)
                        .font(.defaultPlaceholder)
                        .frame(maxWidth: 240)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.primaryColor)
                                .padding(.top, 35)
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onChange(of: searchText) { text in
                            let formattedText = viewModel.removeLeadingSpaces(text)
                            ingredientsSearched = viewModel.searchIngredients(text: formattedText)
                        }
                    
                    OptionButton(icon: "plus") {
                        
                    }
                    OptionButton(icon: "filter") {
                        showFilters = true
                    }
                    .sheet(isPresented: $showFilters) {
                        FilterView()
                            .presentationDetents([.large, .fraction(0.85)])
                            .presentationDragIndicator(.visible)
                        
                        
                    }
                }
            }
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
                    ForEach(Array(isSearchBarEmpty ? viewModel.ingredients.enumerated() : ingredientsSearched.enumerated()), id: \.element) { (index, ingredient) in
                        IngredientLabel(ingredientIcon: ingredient.icon, ingredientName: ingredient.name)
                            .opacity(isLabelVisible[index] ? 1 : 0)
                            .padding(.top, isLabelVisible[index] ? 0 : 20 )
                            .onAppear {
                                if index < 14 && isHeaderVisible{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 * Double(index)) {
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            isLabelVisible[index] = true
                                        }
                                    }
                                } else {
                                    isLabelVisible[index] = true
                                }
                            }
                    }
                }
                .padding(.vertical, 20)
            }
            
        }
        .padding(.horizontal, 20)
        .background(Color.background)
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
