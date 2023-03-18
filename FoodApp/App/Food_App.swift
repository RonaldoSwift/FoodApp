//
//  FoodAppApp.swift
//  Food_App
//
//  Created by Ronaldo on 14/03/23.
//

import SwiftUI

@main
struct Food_App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared
    @ObservedObject var appSharedViewModel: AppSharedViewModel = AppSharedViewModel()
    
    var body: some Scene {
        WindowGroup {
            BienvenidaView()
                .id(appSharedViewModel.roodViewId)
                .environmentObject(appSharedViewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
