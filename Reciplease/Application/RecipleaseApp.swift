//
//  RecipleaseApp.swift
//  Reciplease
//
//  Created by Zidouni on 10/05/2023.
//

import SwiftUI

@main
struct RecipleaseApp: App {
    @StateObject private var appSettings = AppSettings()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
           LaunchScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(appSettings)
        }
    }
}
