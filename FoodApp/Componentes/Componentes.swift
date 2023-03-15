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
        Image("LogoPrincipal")
            .resizable()
            .scaledToFit()
            .frame(width: 30,height: 20)
        
        Button {
            print("Skip")
        } label: {
            Text("Skip")
        }
        .foregroundColor(Color.red)
        .padding(.trailing,30)
    }
}

func CapsulaParaColocarText(textoSuperior:String,textoDeAgua: String,email: Binding<String>) -> some View{
    return VStack{
        Text(textoSuperior)
        TextField(textoDeAgua, text: email)
            .padding()
            .background(Color.orange)
            .cornerRadius(10)
    }
}

func GoogleCapsula() -> some View{
    return HStack{
        Image("IconoGoogle")
            .resizable()
            .scaledToFit()
            .frame(width: 20,height: 20)
        Text("Sign-in with Google")
    }
    .padding()
    .foregroundColor(Color.black)
    .background(Color.white)
    .cornerRadius(10)
}

