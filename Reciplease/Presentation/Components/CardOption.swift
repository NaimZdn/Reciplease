//
//  CardOption.swift
//  Reciplease
//
//  Created by Zidouni on 27/05/2023.
//

import SwiftUI

struct CardOption: View {
    var optionText : String
    var optionIcon : String
    
    var body: some View {
        HStack(spacing: 5) {
            Image(optionIcon)
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.cardTitleIcon)
            
            Text(optionText)
                .font(.cardOption)
                .foregroundColor(.cardOptionText)
        
        }
    }
}

struct CardOption_Previews: PreviewProvider {
    static var previews: some View {
        CardOption(optionText: "1 ppl", optionIcon: "tablewar")
    }
}
