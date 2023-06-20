//
//  IngredientList.swift
//  Reciplease
//
//  Created by Zidouni on 19/06/2023.
//

import SwiftUI

struct IngredientList: View {
    @Binding var ingredient: String
    @Binding var quantity: String
    var body: some View {
        HStack(spacing: 10) {
            IngredientListLabel(ingredient: ingredient)
            
            Text(quantity)
                .font(.defaultBody)
                .foregroundColor(.primaryColor)
        }
    }
}

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        IngredientList(ingredient: .constant("🐓"), quantity: .constant("100g Chicken Escalope"))
    }
}
