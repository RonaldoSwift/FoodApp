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
    
    var body: some View {
        VStack{
            
            
            Text("TabPrincipal")
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            trailing: Button(action: {
                mostrarBottomSheet = true
            }, label: {
                Image("LogoPrincipal")
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
