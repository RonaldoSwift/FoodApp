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
            Color(Assets.Colours.colorBlancoPantalla.name).ignoresSafeArea()
            VStack{
                Text(L10n.Forgot.titulo)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                    .padding(.top,100)
                    .padding(.bottom,10)
                Text(L10n.Forgot.concepto)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)
                    .foregroundColor(Color(Assets.Colours.colorPlomeado.name))
                    .padding(.bottom,40)
                
                CapsulaParaColocarText(textoSuperior: L10n.Forgot.email, textoDePlaceHolder: L10n.Forgot.letraAgua, textoBinding: $emailForgot, texto: emailForgot)
                
                Spacer()
                
                GoogleCapsula()
                
                CapsulaNaranja(textoDelBoton: L10n.Forgot.reiniciar, clickEnBoton: {
                    irAResetPaswordView = true
                })
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(L10n.Forgot.letraRoja)
                        .foregroundColor(Color.red)
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
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
