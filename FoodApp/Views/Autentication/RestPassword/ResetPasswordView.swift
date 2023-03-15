//
//  ResetPasswordView.swift
//  FoodApp
//
//  Created by Ronaldo on 15/03/23.
//

import SwiftUI

struct ResetPasswordView: View {
    var body: some View {
        VStack{
            NavigationLink {
                NewPasswordView()
            } label: {
                Text("Cambiar nuevo password")
            }

        }
        .navigationTitle("Reste Password")
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
