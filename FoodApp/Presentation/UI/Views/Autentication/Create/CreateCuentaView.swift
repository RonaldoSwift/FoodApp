//
//  CreateCuentaView.swift
//  FoodApp
//
//  Created by Ronaldo on 14/03/23.
//

import SwiftUI

struct CreateCuentaView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var viajarATabPrincipal: Bool = false
    @State private var viajarALoginView: Bool = false

    var body: some View {
        
        ZStack{
            Color("ColorFondoPantalla").ignoresSafeArea()
            VStack{
                //PARTESUPERIOR EN COMPONENTES
                ParteSuperior()
                
                Text("Create an account")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                Text("Welcome friend, enter your details so lets get started in ordering food.")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                    .foregroundColor(Color("ColorLetrasPequeñas"))
                    .padding(.bottom,30)
                
                CapsulaParaColocarText(textoSuperior: "Email Address", textoDeAgua: "Enter email", email: $email)
                CapsulaParaColocarText(textoSuperior: "Password", textoDeAgua: "Enter password", email: $password)
                CapsulaParaColocarText(textoSuperior: "Confirm Password", textoDeAgua: "Confirm Password", email: $confirmPassword)
                    .padding(.bottom,30)

                
                GoogleCapsula()
                
                //Boton Naranja
                CapsulaNaranja(textoDelBoton: "Create an account", clickEnBoton: {
                    viajarATabPrincipal = true
                })
                //Letra roja
                LetraInferiorButton(textoDelBoton: "Login to my account", clickEnBoton: {
                    viajarALoginView = true
                })
                .padding(.bottom,10)
                
            }
            .navigationBarBackButtonHidden(true)
            .padding()
            NavigationLink(destination: TabPrincipalView(), isActive: $viajarATabPrincipal) {
                EmptyView()
            }
            
            NavigationLink(destination: LoginView(), isActive: $viajarALoginView) {
                EmptyView()
            }
        }
    }
}

struct CreateCuentaView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCuentaView()
    }
}
