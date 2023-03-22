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
        BienvenidaModelo.init(
            id: "1",
            titulo: L10n.Bienvenida.tituloSlideUno,
            imagen: Assets.Bienvenida.primeraImagen.image),
        
        BienvenidaModelo.init(
            id: "2",
            titulo: L10n.Bienvenida.tituloSlideDos,
            imagen: Assets.Bienvenida.segundaImagen.image),
        
        BienvenidaModelo.init(
            id: "3",
            titulo: L10n.Bienvenida.tituloSlideTres,
            imagen: Assets.Bienvenida.terceraImagen.image)
    ]
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(Assets.Colours.colorBlancoPantalla.name).ignoresSafeArea()
                VStack{
                    //Imagenes
                    PagingView(index: $index.animation(), maxIndex: modelos.count - 1) {
                        ForEach(self.modelos, id: \.id) { (bienvenidaModelo: BienvenidaModelo) in
                            CeldaBienvenida(bienvenidaModelo: bienvenidaModelo)
                        }
                    }
                    .aspectRatio(4 / 3, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    PageControlView(index: $index, maxIndex: modelos.count - 1)
                    
                    
                    CapsulaNaranja(textoDelBoton: "Create an account") {
                        irACreateCuentaView = true
                    }
                    
                    LetraInferiorButton(textoDelBoton: "Login") {
                        irALoginView = true
                    }
                    .padding(.bottom,130)
                }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                    Text("Skip")
                    .foregroundColor(Color.red)
                    .underline(true, color: Color.red)
                )
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        Image(uiImage: Assets.Comun.logoPrincipal.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 34)
                    }
                })
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                
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
                .padding(.bottom, 20)
            Image(uiImage: bienvenidaModelo.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 335,height: 267)
        }
    }
}

struct BienvenidaView_Previews: PreviewProvider {
    static var previews: some View {
        BienvenidaView()
    }
}
