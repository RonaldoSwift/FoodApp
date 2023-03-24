//
//  HomeView.swift
//  FoodApp
//
//  Created by Ronaldo on 22/03/23.
//

import Kingfisher
import SwiftUI
import UIKit

struct HomeView: View {
    @State private var mostrarBottomSheet = false
    @EnvironmentObject private var appSharedViewModel: AppSharedViewModel
    @ObservedObject private var homeViewModel : HomeViewModel = HomeViewModel()
    @State private var uiImage: UIImage? = nil
    @State private var listaDeCategorias: [Categoria] = []
    @State private var detalleDeMusica: Bool = false
    
    
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                
                Text("Enjoy Delicious food")
                    .font(.title2)
                
                ScrollView(.horizontal){
                    
                    HStack{
                        ForEach(listaDeCategorias, id:  \.id) { categoria in
                            celdaDeCategoria(categoria: categoria) {
                                detalleDeMusica = true
                            }
                        }
                        
                        //                                .resizable()
                        //                                .scaledToFit()
                        //                                .frame(width: 150,height: 200)
                        //                                .clipShape(Circle())
                        //                                .overlay(Circle().stroke(Color.green, lineWidth: 2))
                        //                                .shadow(radius: 3)
                        
                    }
                }
                
                HStack{
                    Text("Popular restaurants")
                        .font(.title2)
                        .foregroundColor(Color.black)
                    Spacer()
                    Button {
                        print("29")
                    } label: {
                        Text("View all(29)")
                            .foregroundColor(Color.red)
                            .underline(true, color: Color.red)
                    }
                }
                
                ScrollView(.horizontal){
                    VStack{
                        Image("Hamburguesa")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170,height: 112)
                        
                        Text("Big cheese burger")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("No 10 opp lekki phase 1 bridge in sangotedo estate")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack{
                            Button   {
                                print("Star")
                            } label: {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.yellow)
                                
                            }
                            Text("4+")
                            Spacer()
                            Button   {
                                print("Heart")
                            } label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(Color.red)
                            }
                        }
                    }
                    .padding()
                }
                
            }
            .padding()
            
        }
        .onReceive(homeViewModel.$categorias) { categoria in
            listaDeCategorias = categoria
        }
        .onAppear{
            homeViewModel.traerCategoriasDeFireBase()
        }
    }
    
    private func celdaDeCategoria(categoria:Categoria,clickEnCelda: @escaping () -> Void) -> some View{
        ZStack{
            ZStack{
                VStack(){
                    KFImage(URL(string: categoria.imagen))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60,height: 60)
                    Text("\(categoria.titulo)")
                        .lineLimit(1)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 80)
                        .fill(Color.green)
                )
                .frame(width: 120,height: 160)
                
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 80)
                    .stroke(Color.green,lineWidth: 2)
            )
        }
        .padding()
        .onTapGesture {
            clickEnCelda()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
