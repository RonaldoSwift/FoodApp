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
            Color("ColorFondoPantalla").ignoresSafeArea()
            VStack{
                ParteSuperior()
                
                Text("Login to your account")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                Text("Good to see you again, enter your details below to continue ordering.")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                    .foregroundColor(Color("ColorLetrasPequeñas"))
                    .padding(.bottom,40)
                
                CapsulaParaColocarText(textoSuperior: "Email Address", textoDeAgua: "Enter email", email: $emailLogin)
                
                CapsulaParaColocarText(textoSuperior: "Password", textoDeAgua: "Enter password", email: $paswordLogin)
                    .padding(.bottom,130)
                
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
            .padding()
            
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
