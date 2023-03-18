//
//  NewPasswordView.swift
//  FoodApp
//
//  Created by Ronaldo on 15/03/23.
//

import SwiftUI

struct NewPasswordView: View {
    var body: some View {
        ZStack{
            Color(Assets.Colours.colorBlancoPantalla.name).ignoresSafeArea()
            VStack{
                
                Text("hello")
                    .padding()
                    .foregroundColor(Color.black)
                
                
                NavigationLink {
                    TabPrincipalView()
                } label: {
                    Text("Aceptar")
                }
                
                
            }
            .navigationTitle("Nuevo Password")
        }
    }
}

struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordView()
    }
}
