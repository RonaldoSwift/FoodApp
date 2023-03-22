//
//  ResetPasswordView.swift
//  FoodApp
//
//  Created by Ronaldo on 15/03/23.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var irANewPaswordView = false
    
    var body: some View {
        ZStack{
            Color(Assets.Colours.colorBlancoPantalla.name).ignoresSafeArea()
            VStack{
                Text(L10n.Reset
                    .titulo)
                .font(.title)
                .bold()
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.bottom,30)
                .padding(.top,100)
                Text(L10n.Reset.concepto)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)
                    .foregroundColor(Color(Assets.Colours.colorPlomeado.name))
                    .padding(.bottom,30)
                
                Text(L10n.Reset.code)
                    .foregroundColor(Color.black)
                
                HStack{
                    Button {
                        print("")
                    } label: {
                        Text("3")
                            .padding()
                    }
                    
                    
                    Button {
                        print("")
                    } label: {
                        Text("4")
                            .padding()
                    }
                    
                    
                    Button {
                        print("")
                    } label: {
                        Text("5")
                            .padding()
                    }
                    
                    Button {
                        print("")
                    } label: {
                        Text("6")
                            .padding()
                    }
                    
                }
                .keyboardType(.numberPad)
                
                CapsulaNaranja(textoDelBoton: L10n.Reset.capsulaNaranja) {
                    irANewPaswordView = true
                }
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing:
                                    Text("Cancel")
                .foregroundColor(Color.red)
                .underline(true, color: Color.red)
            )
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Image(uiImage: Assets.Comun.logoPrincipal.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 34)
                }
            })
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            
            NavigationLink(destination: NewPasswordView(), isActive: $irANewPaswordView) {
                EmptyView()
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
