//
//  CreateIngredientView.swift
//  Reciplease
//
//  Created by Zidouni on 09/06/2023.
//

import SwiftUI

struct CreateIngredientView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var id = ""
    @State private var name = ""
    @State private var idCounter = 0
    @State private var nameCounter = 0
    
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Add your product")
                    .font(.defaultTitle)
                    .foregroundColor(Color.primaryColor)
                
                Spacer()
                
                OptionButton(icon: "xmark") {
                    presentationMode.wrappedValue.dismiss()
                    
                }
            }
            .padding(.top, 30)
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
            
            VStack(spacing: 10) {
                Text(id)
                    .font(.defaultTitle2)
                    .background(
                        viewModel.isNotEmoji(id) ? Color.addIngredientIcon
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .mask(
                                Capsule()
                                    .fill()
                                    .frame(width: 30, height: 30, alignment: .topLeading)
                            ) : nil
                    )
                
                Text(name)
                    .font(.defaultBody)
                    .foregroundColor(.cardTitleIcon)
                
                
            }
            .frame(maxWidth: 170, minHeight: 105)
            .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding(.bottom, 25)
            
            HStack(spacing: 10) {
                CustomTextField(text: $id, placeholder: "ID", charactersLimit: 1, size: 80, charactersCounter: true)
                
                Spacer()
                
                CustomTextField(text: $name, placeholder: "Name", charactersLimit: 12, size: .infinity, charactersCounter: true)
                
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            ValidateButton(buttonCaption: .constant("Add")) {
                viewModel.addIngredient(name: name, icon: id, isSelected: false)
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding(.bottom, 20)
        }
        .background(Color.background)
    }
}

struct AddIngredient_Previews: PreviewProvider {
    static var previews: some View {
        CreateIngredientView(viewModel: CartViewModel())
    }
}
