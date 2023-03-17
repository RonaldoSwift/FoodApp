//
//  BienvenidaView.swift
//  FoodApp
//
//  Created by Ronaldo on 14/03/23.
//

import SwiftUI

struct BienvenidaView: View {
    @State var index = 0
    @State private var irACreateCuentaView: Bool = false
    @State private var irALoginView: Bool = false
    
    var modelos: [BienvenidaModelo] = [
        BienvenidaModelo.init(id: "1", titulo: "Order from your favourite stores or vendors", imagen: "BienvenidaUno"),
        BienvenidaModelo.init(id: "2", titulo: "Choose from a wide range of delicious meals", imagen: "BienvenidaDos"),
        BienvenidaModelo.init(id: "3", titulo: "Enjoy instant delivery and payment", imagen: "BienvenidaTres")
    ]
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("ColorFondoPantalla").ignoresSafeArea()
                VStack{
                    ParteSuperior()
                    
                    //Imagenes
                    PagingView(index: $index.animation(), maxIndex: modelos.count - 1) {
                        ForEach(self.modelos, id: \.id) { (bienvenidaModelo: BienvenidaModelo) in
                            CeldaBienvenida(bienvenidaModelo: bienvenidaModelo)
                        }
                    }
                    .aspectRatio(4 / 3, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    PageControlView(index: $index, maxIndex: modelos.count - 1)
                    
                    
                    Spacer()
                    
                    CapsulaNaranja(textoDelBoton: "Create an account") {
                        irACreateCuentaView = true
                    }
                    
                    LetraInferiorButton(textoDelBoton: "Login") {
                        irALoginView = true
                    }
                }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                NavigationLink(destination: CreateCuentaView(), isActive: $irACreateCuentaView) {
                    EmptyView()
                }
                NavigationLink(destination: LoginView(), isActive: $irALoginView) {
                    EmptyView()
                }
                
            }
        }
    }
    
    private func CeldaBienvenida(bienvenidaModelo:BienvenidaModelo)-> some View{
        return VStack{
            Text(bienvenidaModelo.titulo)
                .font(.title2)
                .bold()
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            Image(bienvenidaModelo.imagen)
                .resizable()
                .scaledToFit()
        }
    }
}

struct BienvenidaView_Previews: PreviewProvider {
    static var previews: some View {
        BienvenidaView()
    }
}
