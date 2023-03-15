//
//  BienvenidaView.swift
//  FoodApp
//
//  Created by Ronaldo on 14/03/23.
//

import SwiftUI

struct BienvenidaView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink {
                    CreateCuentaView()
                } label: {
                    Text("Ir a Crear Cuenta")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                }
                
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Ir a Login")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                }
            }
            .navigationTitle("Bienvenida")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

struct BienvenidaView_Previews: PreviewProvider {
    static var previews: some View {
        BienvenidaView()
    }
}
