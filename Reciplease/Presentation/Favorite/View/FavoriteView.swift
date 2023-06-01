//
//  FavoriteView.swift
//  Reciplease
//
//  Created by Zidouni on 27/05/2023.
//

import SwiftUI

struct FavoriteView: View {
    @State private var searchText = ""
    
    @State private var array = ["hi", "hello"]
    
    var body: some View {
        VStack {
            VStack {
                Text("Favorite")
                    .font(.defaultTitle)
                    .foregroundColor(Color.primaryColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 15) {
                    TextField("Search for a recipe", text: $searchText)
                        .font(.defaultPlaceholder)
                        .frame(maxWidth: 240)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.primaryColor)
                                .padding(.top, 35)
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    OptionButton(icon: "filter")
                    
                }
            }
            .padding(.vertical, 10)
            .background(Color.background)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    FavoriteCard()
                    FavoriteCard()
                    
                }
                .padding(.vertical, 20)
            }
        }
        .padding(.horizontal, 20)
        .background(Color.background)
        
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
