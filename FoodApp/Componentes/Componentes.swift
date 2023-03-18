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
        Image(uiImage: Assets.Comun.logoPrincipal.image)
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

func CapsulaParaColocarText(textoSuperior:String, textoDePlaceHolder: String,
                            textoBinding: Binding<String>, texto: String) -> some View{
    return VStack{
        Text(textoSuperior)
            .foregroundColor(Color.black)
            .font(.system(size: 14))
            .frame(maxWidth: .infinity,alignment: .leading)
        
        TextField("", text: textoBinding)
            .placeholder(when: texto.isEmpty, placeholder: {
                Text(textoDePlaceHolder)
                    .foregroundColor(Color(Assets.Colours.colorPlaceHolder.name))
            })
            .padding()
            .foregroundColor(Color.black)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(Assets.Colours.colorBordeTextInput.name), lineWidth: 1)
                    .frame(height: 50)
                    .background(Color.white)

            )
    }
}

func GoogleCapsula() -> some View{
    return HStack{
        Image(uiImage: Assets.Comun.iconoGoogle.image)
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
            .background(Color(Assets.Colours.colorBotonNaranja.name))
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
