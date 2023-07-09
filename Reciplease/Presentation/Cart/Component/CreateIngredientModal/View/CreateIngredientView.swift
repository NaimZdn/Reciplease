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
    
    @State private var isDisabled = true
    @State private var ingredientAlreadyExist = false
    
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
            
            if ingredientAlreadyExist {
                HStack(spacing: 20) {
                    Image(systemName:"xmark.circle")
                        .foregroundColor(.popUpError)
                        .font(.defaultTitle3)
                    
                    Text("This ingredient already exist !")
                        .font(.defaultLabelCaption)
                        .foregroundColor(.primaryColor)
                    
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            self.ingredientAlreadyExist = false
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 70, alignment: .leading)
                .padding(20)
                
            }
            
            Spacer()
            
            ValidateButton(buttonCaption: .constant("Add")) {
                if isDisabled == false {
                   let containsCreatedIngredient = viewModel.ingredients.contains { ingredient in
                        ingredient.name == name
                    }

                    if !containsCreatedIngredient  {
                        viewModel.addIngredientInApp(name: name, icon: id, isSelected: false)
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            ingredientAlreadyExist = true
                        }
                    }
                    
                }
            }
            .onChange(of: id, perform: { newValue in
                if !newValue.isEmpty && !name.isEmpty {
                    isDisabled = false
                } else {
                    isDisabled = true
                }
            })
            .onChange(of: name, perform: { newValue in
                if !newValue.isEmpty && !id.isEmpty {
                    isDisabled = false
                } else {
                    isDisabled = true
                }
            })
            
            .disabled(isDisabled)
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
