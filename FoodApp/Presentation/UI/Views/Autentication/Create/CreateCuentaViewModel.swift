//
//  CreateCuentaViewModel.swift
//  FoodApp
//
//  Created by Ronaldo on 21/03/23.
//

import FirebaseAuth
import Foundation

class CreateCuentaViewModel: ObservableObject{
    @Published var irATabPrincipal: Bool = false
    @Published var estaCargando: Bool = false
    @Published var mostrarErrorAlert: Bool = false
    @Published var irARegister: Bool = false
    
    func signUp(email: String, pasword: String) {
        estaCargando = true
        Auth.auth().createUser(withEmail: email, password: pasword) { [self] _, error in
            if let errorNoNulo = error {
                mostrarErrorAlert = true
                estaCargando = false
            } else {
                estaCargando = false
                irATabPrincipal = true
            }
        }
    }
}
