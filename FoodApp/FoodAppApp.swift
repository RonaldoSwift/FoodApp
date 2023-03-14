//
//  FoodAppApp.swift
//  FoodApp
//
//  Created by Ronaldo on 14/03/23.
//

import SwiftUI

@main
struct FoodAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
