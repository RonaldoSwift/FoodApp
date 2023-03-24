//
//  NewPasswordView.swift
//  FoodApp
//
//  Created by Ronaldo on 15/03/23.
//

import SwiftUI

struct NewPasswordView: View {
    @State private var password: String = ""
    @State private var rePassword: String = ""
    @State private var irATabPrincipalView = false
    var body: some View {
        ZStack{
            VStack{
                
                Text(L10n.New.titulo)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom,14)
                    .padding(.top,20)
                
                Text(L10n.New.concepto)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color(Assets.Colours.colorPlomeado.name))
                    .padding(.bottom,40)
                
                CapsulaParaColocarText(textoSuperior: L10n.New.textoSuperior, textoDePlaceHolder: L10n.New.letraAgua, textoBinding: $password,texto: password)
                
                CapsulaParaColocarText(textoSuperior: L10n.New.textoDosSuperior, textoDePlaceHolder: L10n.New.letraAguaDos, textoBinding: $rePassword, texto: rePassword)
                
                Spacer()
                
                GoogleCapsula()
                
                CapsulaNaranja(textoDelBoton: L10n.New.capsulanaranja, clickEnBoton: {
                    irATabPrincipalView = true
                })
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
            NavigationLink(destination: TabPrincipalView(), isActive: $irATabPrincipalView) {
                EmptyView()
            }
        }
    }
}

struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordView()
    }
}
