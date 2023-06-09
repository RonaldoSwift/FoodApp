//
//  LoginViewModel.swift
//  FoodApp
//
//  Created by Ronaldo on 17/03/23.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject{
    
    @Published var irATabPrincipal: Bool = false
    @Published var mostrarErrorAlert: Bool = false
    @Published var estaCargando: Bool = false
    
    func signIn(email:String, password:String){
        estaCargando = true
        Auth.auth().signIn(withEmail: email, password: password){[self] _, error in
            if let errorNulo = error {
                mostrarErrorAlert = true
                estaCargando = false
            } else {
                estaCargando = false
                irATabPrincipal = true
            }
        }
    }
}
