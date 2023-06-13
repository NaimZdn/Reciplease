//
//  SectionTitle.swift
//  Reciplease
//
//  Created by Zidouni on 11/06/2023.
//

import SwiftUI

struct SectionTitle: View {
    @Binding var showBackground: Bool
    var title: String
    var duration: Double
    
    var body: some View {
        Text(title)
            .font(.defaultTitle)
            .foregroundColor(.primaryColor)
            .background(
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(maxWidth: showBackground ? .infinity : 0, maxHeight: 10)
                        .padding(.top, 5)
                        .foregroundColor(.titleBackground)
                        .onAppear{
                            withAnimation(.easeInOut(duration: duration)) {
                                showBackground = true
                            }
                            
                        }
                }
            )
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SectionTitle_Previews: PreviewProvider {
    
    static var previews: some View {
        SectionTitle(showBackground: .constant(false), title: "App description", duration: 1)
    }
}
