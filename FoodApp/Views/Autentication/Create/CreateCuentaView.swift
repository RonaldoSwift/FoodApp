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
                Text("Welcome friend, enter your details so lets get started in ordering food.")
                    .multilineTextAlignment(.leading)
                
                CapsulaParaColocarText(textoSuperior: "Email Address", textoDeAgua: "Enter email", email: $email)
                CapsulaParaColocarText(textoSuperior: "Password", textoDeAgua: "Enter password", email: $email)
                CapsulaParaColocarText(textoSuperior: "Confirm Password", textoDeAgua: "Confirm Password", email: $email)
                
                GoogleCapsula()
                
                
                
                NavigationLink {
                    TabPrincipalView()
                } label: {
                    Text("Ir a TabView")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                }
                
                
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Ir a LoginView")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                }
            }
            .padding()
        }
    }
}

struct CreateCuentaView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCuentaView()
    }
}
