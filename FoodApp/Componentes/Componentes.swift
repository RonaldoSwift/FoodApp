//
//  Componentes.swift
//  FoodApp
//
//  Created by Ronaldo on 15/03/23.
//

import Foundation
import SwiftUI

func ParteSuperior() -> some  View {
    return  HStack{
        Spacer()
        Spacer()
        Image("LogoPrincipal")
            .resizable()
            .scaledToFit()
            .frame(width: 30,height: 20)
        Spacer()
        Button {
            print("Skip")
        } label: {
            Text("Skip")
                .underline(true, color: Color.red)
        }
        .foregroundColor(Color.red)
    }
}

func CapsulaParaColocarText(textoSuperior:String,textoDeAgua: String,email: Binding<String>) -> some View{
    return VStack{
        Text(textoSuperior)
            .foregroundColor(Color.black)
            .padding(.trailing,200)
            .multilineTextAlignment(.leading)
        TextField(textoDeAgua, text: email)
            .padding()
            .foregroundColor(Color.black)
            .background(
                Capsule()
                    .inset(by: 2)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 334, height: 50)
            )
            .clipShape(Capsule())
        
    }
}

func GoogleCapsula() -> some View{
    return HStack{
        Image("IconoGoogle")
            .resizable()
            .scaledToFit()
            .frame(width: 20,height: 20)
        Text("Sign-in with Google")
            .underline(true, color: Color.black)

    }
    .padding()
    .foregroundColor(Color.black)
    .background(Color.white)
    .cornerRadius(10)
}

func CapsulaNaranja(textoDelBoton:String, clickEnBoton: @escaping () -> Void ) -> some View{
    return Button {
        clickEnBoton()
    } label: {
        Text(textoDelBoton)
            .padding()
            .frame(width: 335,height: 51)
            .foregroundColor(Color.white)
            .background(Color("ColorBotonNaranja"))
            .cornerRadius(20)
    }
}

func LetraInferiorButton(textoDelBoton:String, clickEnBoton: @escaping () -> Void) -> some View{
    return Button {
        clickEnBoton()
    } label: {
        Text(textoDelBoton)
            .padding()
            .foregroundColor(Color.red)
    }
}
