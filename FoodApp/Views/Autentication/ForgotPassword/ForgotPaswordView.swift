//
//  ForgotPaswordView.swift
//  FoodApp
//
//  Created by Ronaldo on 15/03/23.
//

import SwiftUI

struct ForgotPaswordView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack{
            
            NavigationLink {
                ResetPasswordView()
            } label: {
                Text("Reinciar Contraseña")
            }
            
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Login to my account")
            }

        }
        .navigationTitle("fORGOT pasword")
    }
}

struct ForgotPaswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPaswordView()
    }
}
