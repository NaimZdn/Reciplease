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
    
    @State private var recipes = [1, 1, 1]

    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color.background)
                .frame(maxWidth: .infinity, maxHeight: 5)
            
            ScrollView {
                VStack(spacing: 10) {
                    
                    ForEach(recipes, id: \.self) { _ in
                        RecipeCard()
                    }
                }
                .padding(.top, 15)
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal ) {
                HStack(alignment: .center) {
                    Text("Recipe")
                        .font(.defaultTitle3)
                        .foregroundColor(Color.primaryColor)
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
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
