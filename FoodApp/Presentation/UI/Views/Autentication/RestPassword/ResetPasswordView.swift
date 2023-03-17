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
            Color("ColorFondoPantalla").ignoresSafeArea()
            VStack{
                ParteSuperior()
                    .padding(.bottom,90)
                
                Text("Reset password")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                Text("A reset code has been sent to your email")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)
                    .foregroundColor(Color("ColorLetrasPequeñas"))
                    .padding(.bottom,30)
                
                Text("Enter code")
                
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
                
                CapsulaNaranja(textoDelBoton: "Cambiar nuevo password") {
                    irANewPaswordView = true
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
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
