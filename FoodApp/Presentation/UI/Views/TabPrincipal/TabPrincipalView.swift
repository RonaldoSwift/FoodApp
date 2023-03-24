//
//  TabPrincipalView.swift
//  FoodApp
//
//  Created by Ronaldo on 15/03/23.
//

import SwiftUI

struct TabPrincipalView: View {
    @State private var mostrarBottomSheet = false
    @EnvironmentObject private var appSharedViewModel: AppSharedViewModel
    
    @State private var selectionItem = 1
    var body: some View {
        TabView(selection: $selectionItem) {
            HomeView()
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
                .tag(1)
            LikeView()
                .tabItem {
                    Label("", systemImage: "heart.fill")
                }
                .tag(2)
            LupaView()
                .tabItem {
                    Label("", systemImage: "magnifyingglass")
                }
                .tag(3)
            NotificationView()
                .tabItem {
                    Label("", systemImage: "bell.fill")
                }
                .tag(4)
            CarritoView()
                .tabItem {
                    Label("",systemImage: "cart.fill")
                }
                .tag(5)
        }
        .accentColor(Color.red)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack{
                    Text("DELIVERY")
                    Text("ADSADV")
                }
                .foregroundColor(Color.black)
            }
        }
        .navigationBarItems(
            leading: Image(systemName: "square.and.arrow.up.fill"), trailing: Button(action: {
                mostrarBottomSheet = true
            }, label: {
                Image("Emoji")
            })
        )
        .sheet(isPresented: $mostrarBottomSheet) {
            Button {
                appSharedViewModel.roodViewId = UUID()
            } label: {
                Text("Cerrar Session")
            }
        }
        
    }
}

struct TabPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        TabPrincipalView()
    }
}
