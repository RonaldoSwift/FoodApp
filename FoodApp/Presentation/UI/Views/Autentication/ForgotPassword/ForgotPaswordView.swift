//
//  ForgotPaswordView.swift
//  FoodApp
//
//  Created by Ronaldo on 15/03/23.
//

import SwiftUI

struct ForgotPaswordView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var emailForgot: String = ""
    @State private var irAResetPaswordView: Bool = false
    
    var body: some View {
        ZStack{
            Color("ColorFondoPantalla").ignoresSafeArea()
            VStack{
                ParteSuperior()
                Text("Forgot password")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                Text("Enter your email address to request a password reset.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)
                    .foregroundColor(Color("ColorLetrasPequeñas"))
                    .padding(.bottom,40)
                
                CapsulaParaColocarText(textoSuperior: "Email Address", textoDeAgua: "Enter email address", email: $emailForgot)
                    .padding(.bottom,90)
                
                GoogleCapsula()
                
                CapsulaNaranja(textoDelBoton: "Reiniciar Contraseña", clickEnBoton: {
                    irAResetPaswordView = true
                })
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Login to my account")
                        .foregroundColor(Color.red)
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationTitle("fORGOT pasword")
            NavigationLink(destination: ResetPasswordView(), isActive: $irAResetPaswordView) {
                EmptyView()
            }
        }
    }
}

struct ForgotPaswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPaswordView()
    }
}
