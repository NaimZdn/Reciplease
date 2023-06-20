//
//  IngredientListLabel.swift
//  Reciplease
//
//  Created by Zidouni on 19/06/2023.
//

import SwiftUI

struct IngredientListLabel: View {
    var ingredient: String
    
    var body: some View {
        HStack {
            Text(ingredient)
                .font(.system(size: 15))
        }
        .frame(width: 40, height: 40)
        .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
    }
}

struct IngredientListLabel_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListLabel(ingredient: "🍏")
    }
}
