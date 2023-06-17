//
//  CustomTextField.swift
//  Reciplease
//
//  Created by Zidouni on 09/06/2023.
//

import SwiftUI

struct CustomTextField: View {
    @ObservedObject private var viewModel = CartViewModel()
    
    @Binding var text: String
    var placeholder: String
    var charactersLimit: Int
    var size: CGFloat
    var charactersCounter: Bool
    
    var body: some View {
        
        VStack(alignment: .trailing, spacing: 15) {
            ZStack(alignment: .trailing) {
                TextField(placeholder, text: $text)
                    .font(.defaultPlaceholder)
                    .overlay(
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.primaryColor)
                            .padding(.top, 35)
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onChange(of: text) { character in
                        if character.count > charactersLimit {
                            text.removeLast()
                        }
                        if viewModel.containsOnlySpaces(text) {
                            text = ""
                        }
                    }
                Button {
                    text = ""
                } label: {
                    if !text.isEmpty {
                        Image("xmark")
                            .foregroundColor(Color.primaryColor)
                            .padding(.trailing, 7)
                    }
                }
            }
            
            if charactersCounter {
                Text("\(text.count)/\(charactersLimit)")
                    .font(.defaultLabelCaption)
                    .foregroundColor(Color.primaryColor)
                
            }
        }
        .frame(maxWidth: size)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: "ID", charactersLimit: 1, size: 60, charactersCounter: true)
    }
}
