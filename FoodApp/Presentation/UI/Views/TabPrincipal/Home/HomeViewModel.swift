//
//  HomeViewModel.swift
//  FoodApp
//
//  Created by Ronaldo on 22/03/23.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore

class HomeViewModel: ObservableObject{
    var fireStore = Firestore.firestore()
    @Published var categorias: [Categoria] = []
    
    func traerCategoriasDeFireBase(){
        var categoriasDeFireBase: [Categoria] = []
        let colecciondeCategorias = fireStore.collection("categorias")
        colecciondeCategorias.getDocuments { (querySnapshot : QuerySnapshot?, error :Error?) in
            guard error == nil else{
                print("Error al tratar de traer categorias")
                return
            }
            if let querySnapshot = querySnapshot {
                for documento in querySnapshot.documents{
                    let data = documento.data()
                    let id = data["id"] as? String ?? ""
                    let image = data["image"] as? String ?? ""
                    let titulo = data["titulo"] as? String ?? ""
                    
                    print("\(id) - \(titulo) - \(image)")
                    categoriasDeFireBase.append(Categoria.init(id: id, imagen: image, titulo: titulo))
                }
                self.categorias = categoriasDeFireBase
            }
        }
    }
}


//    @Published var data: Data? = nil
//
//
//    func irADescripcionView(){
//        let storage = Storage.storage()
//        var pathReference = storage.reference(forURL: "gs://upn-firebase-proyect.appspot.com/categorias/tacos.png")
//        let islandRef = pathReference.child("categorias/tacos.png")
//
//        pathReference.getData(maxSize: 1 * 1024 * 1024) { (data: Data?, error: Error?) in
//            if let error = error{
//                print("No se pudo descargar")
//            } else{
//                self.data = data!
//            }
//        }
//    }

