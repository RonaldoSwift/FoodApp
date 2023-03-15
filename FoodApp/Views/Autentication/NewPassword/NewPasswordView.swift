//
//  NewPasswordView.swift
//  FoodApp
//
//  Created by Ronaldo on 15/03/23.
//

import SwiftUI

struct NewPasswordView: View {
    var body: some View {
        VStack{
            
            NavigationLink {
                TabPrincipalView()
            } label: {
                Text("Aceptar")
            }


        }
        .navigationTitle("Nuevo Password")
    }
}

struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordView()
    }
}
