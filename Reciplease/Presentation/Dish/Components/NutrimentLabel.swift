//
//  NutrimentLabel.swift
//  Reciplease
//
//  Created by Zidouni on 19/06/2023.
//

import SwiftUI

struct NutrimentLabel: View {
    var nutrimentColor: Color
    var title: String
    var value: String
    
    var body: some View {
        VStack(spacing: 15) {
            Text(title)
                .font(.nutrimentTitle)
                .foregroundColor(.cardOptionText)
            
            Text(value)
                .font(.nutrimentValue)
                .foregroundColor(.cardTitleIcon)
            
        }
        .frame(width: 96, height: 92)
        .background(nutrimentColor, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct NutrimentLabel_Previews: PreviewProvider {
    static var previews: some View {
        NutrimentLabel(nutrimentColor: .nutrimentProtein, title: "Protein", value: "40g")
    }
}
