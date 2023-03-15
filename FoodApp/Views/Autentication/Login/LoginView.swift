//
//  LoginView.swift
//  FoodApp
//
//  Created by Ronaldo on 14/03/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            NavigationLink {
                TabPrincipalView()
            } label: {
                Text("Ir a Tab Principal")
            }
            
            
            NavigationLink {
                ForgotPaswordView()
            } label: {
                Text("Ir a Forgot Pasword")
            }
            
        }
        .navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
