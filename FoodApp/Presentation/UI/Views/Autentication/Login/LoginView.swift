//
//  LoginView.swift
//  FoodApp
//
//  Created by Ronaldo on 14/03/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emailLogin: String = ""
    @State private var paswordLogin: String = ""
    @State private var irATabPrincipalView = false
    @State private var irAForgotPaswordView = false
    
    var body: some View {
        ZStack{
            Color(Assets.Colours.colorBlancoPantalla.name).ignoresSafeArea()
            VStack{
                Text("Login to your account")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom,14)
                    .padding(.top,20)

                Text("Good to see you again, enter your details below to continue ordering.")
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color(Assets.Colours.colorPlomeado.name))
                    .padding(.bottom,40)
                
                CapsulaParaColocarText(textoSuperior: "Email Address", textoDePlaceHolder: "Enter email", textoBinding: $emailLogin,texto: emailLogin)
                
                CapsulaParaColocarText(textoSuperior: "Password", textoDePlaceHolder: "Enter password", textoBinding: $paswordLogin, texto: paswordLogin)
                
                Spacer()
                
                GoogleCapsula()
                
                CapsulaNaranja(textoDelBoton: "Create an account", clickEnBoton: {
                    irATabPrincipalView = true
                })
                
                LetraInferiorButton(textoDelBoton: "Login to my account", clickEnBoton: {
                    irAForgotPaswordView = true
                })
            }
            .navigationTitle("Login")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing:
                Text("Skip")
                .foregroundColor(Color.red)
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
            
            NavigationLink(destination: TabPrincipalView(), isActive: $irATabPrincipalView) {
                EmptyView()
            }
            NavigationLink(destination: ForgotPaswordView(), isActive: $irAForgotPaswordView) {
                EmptyView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
