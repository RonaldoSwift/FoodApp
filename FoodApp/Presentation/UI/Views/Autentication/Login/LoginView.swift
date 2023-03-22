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
    @State private var loginViewModel : LoginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack{
            Color(Assets.Colours.colorBlancoPantalla.name).ignoresSafeArea()
            VStack{
                Text(L10n.Login.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom,14)
                    .padding(.top,20)
                
                Text(L10n.Login.concepto)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color(Assets.Colours.colorPlomeado.name))
                    .padding(.bottom,40)
                
                CapsulaParaColocarText(textoSuperior: L10n.Login.capsulaSuperior, textoDePlaceHolder: L10n.Login.letraAgua, textoBinding: $emailLogin,texto: emailLogin)
                
                CapsulaParaColocarText(textoSuperior: L10n.Login.capsulaDos, textoDePlaceHolder: L10n.Login.letraAguaDos, textoBinding: $paswordLogin, texto: paswordLogin)
                
                Spacer()
                
                GoogleCapsula()
                
                CapsulaNaranja(textoDelBoton: L10n.Login.capsulaNaranja, clickEnBoton: {
                    loginViewModel.signIn(email: emailLogin, password: paswordLogin)
                    irATabPrincipalView = true
                })
                
                LetraInferiorButton(textoDelBoton: L10n.Login.letraRoja, clickEnBoton: {
                    irAForgotPaswordView = true
                })
            }
            .navigationTitle("Login")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing:
                                    Text("Skip")
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
            
            NavigationLink(destination: TabPrincipalView(), isActive: $irATabPrincipalView) {
                EmptyView()
            }
            NavigationLink(destination: ForgotPaswordView(), isActive: $irAForgotPaswordView) {
                EmptyView()
            }
        }
        .onReceive(loginViewModel.$irATabPrincipal) { irATabPrincipal in
            self.irATabPrincipalView = irATabPrincipal
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
