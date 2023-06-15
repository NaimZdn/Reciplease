//
//  AddIngredient.swift
//  Reciplease
//
//  Created by Zidouni on 09/06/2023.
//

import SwiftUI

struct AddIngredient: View {
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
                    
                }
            }
            .padding(.top, 30)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            
           Text(id)
                .font(.defaultBody)
                .frame(maxWidth: 220, maxHeight: 130)
                .background(Color.labelBackground, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                .padding(.bottom, 25)
            
            HStack(spacing: 30) {
                VStack(alignment: .trailing, spacing: 15) {
                    TextField("ID", text: $id)
                        .font(.defaultPlaceholder)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.primaryColor)
                                .padding(.top, 35)
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(idCounter)/1")
                        .font(.defaultLabelCaption)
                        .foregroundColor(Color.primaryColor)
                        .onChange(of: id) { newValue in
                            if newValue.count > 1 {
                                id.removeLast()
                            } else {
                                idCounter = newValue.count
                            }
                        }
                }
                .frame(maxWidth: 60)
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 15) {
                    TextField("Name", text: $name)
                        .font(.defaultPlaceholder)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.primaryColor)
                                .padding(.top, 35)
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(nameCounter)/12")
                        .font(.defaultLabelCaption)
                        .foregroundColor(Color.primaryColor)
                        .onChange(of: name) { newValue in
                            if newValue.count > 12 {
                                name.removeLast()
                            } else {
                                nameCounter = newValue.count
                            }
                        }
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()

            ValidateButton(buttonCaption: .constant("Add")) {
                viewModel.addIngredient(name: name, icon: id, isSelected: false)
                print(viewModel.ingredients)
            }
        }
    }
}

struct AddIngredient_Previews: PreviewProvider {
    static var previews: some View {
        AddIngredient(viewModel: CartViewModel())
    }
}
