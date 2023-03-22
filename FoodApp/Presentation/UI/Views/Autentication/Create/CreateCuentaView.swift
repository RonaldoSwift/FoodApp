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
    @State private var createCuentaViewModel: CreateCuentaViewModel = CreateCuentaViewModel()
    @State private var estaCargando: Bool = false
    @State private var mostrarErrorAlert: Bool = false

    var body: some View {
        
        ZStack{
            Color(Assets.Colours.colorBlancoPantalla.name).ignoresSafeArea()
            VStack{
                Text(L10n.Create.title)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                Text(L10n.Create.concepto)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                    .foregroundColor(Color(Assets.Colours.colorPlomeado.name))
                    .padding(.bottom,30)
                
                CapsulaParaColocarText(textoSuperior: L10n.Create.capsulaSuperior, textoDePlaceHolder: L10n.Create.letraAgua, textoBinding: $email, texto: email)
                CapsulaParaColocarText(textoSuperior: L10n.Create.capsulaDos, textoDePlaceHolder: L10n.Create.letraDosAgua, textoBinding: $password, texto: password)
                CapsulaParaColocarText(textoSuperior: L10n.Create.capsulaTres, textoDePlaceHolder: L10n.Create.letraTresAgua, textoBinding: $confirmPassword, texto: confirmPassword)
                    .padding(.bottom,30)
                
                Spacer()
                
                GoogleCapsula()
                
                //Boton Naranja
                CapsulaNaranja(textoDelBoton: L10n.Create.capsulaNaranja, clickEnBoton: {
                    createCuentaViewModel.signUp(email: email, pasword: password)
                    viajarATabPrincipal = true
                })
                //Letra roja
                LetraInferiorButton(textoDelBoton: L10n.Create.letraRoja, clickEnBoton: {
                    viajarALoginView = true
                })
                .padding(.bottom,10)
                
            }
            .navigationBarBackButtonHidden(true)
            .padding()
            .navigationBarTitleDisplayMode(.inline)
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
           
            
            NavigationLink(destination: TabPrincipalView(), isActive: $viajarATabPrincipal) {
                EmptyView()
            }
            
            NavigationLink(destination: LoginView(), isActive: $viajarALoginView) {
                EmptyView()
            }
        }
        .alert(isPresented: $mostrarErrorAlert, content: {
            Alert(title: Text("hubo un error"))
        })
        .onReceive(createCuentaViewModel.$irATabPrincipal) { irATabPrincipal in
            self.viajarATabPrincipal = irATabPrincipal
        }
    }
}

struct CreateCuentaView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCuentaView()
    }
}
