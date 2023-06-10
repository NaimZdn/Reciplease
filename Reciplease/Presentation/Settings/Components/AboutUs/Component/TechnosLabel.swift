//
//  TechnosLabel.swift
//  Reciplease
//
//  Created by Zidouni on 10/06/2023.
//

import SwiftUI

struct TechnosLabel: View {
    var techno: String
    
    var body: some View {
        HStack {
            Text(techno)
                .font(.defaultLabelCaption)
                .foregroundColor(.primaryColor)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.primaryColor, lineWidth: 1)
                }    
        }
    }
}

struct TechnosLabel_Previews: PreviewProvider {
    static var previews: some View {
        TechnosLabel(techno: "Combine")
    }
}
