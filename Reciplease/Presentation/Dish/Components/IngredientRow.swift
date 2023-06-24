//
//  IngredientList.swift
//  Reciplease
//
//  Created by Zidouni on 19/06/2023.
//

import SwiftUI

struct IngredientList: View {
    var ingredient: String
    var quantity: String
    
    var body: some View {
        
        HStack(spacing: 10) {
            IngredientListLabel(ingredient: ingredient)
            
            Text(quantity)
                .font(.defaultBody)
                .foregroundColor(.primaryColor)
            
            Spacer()
        }
        //.frame(width: .infinity, alignment: .leading)
    }
}

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        IngredientList(ingredient: "🐓", quantity: "100g Chicken Escalope")
    }
}
