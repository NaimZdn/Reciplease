//
//  RecipleaseApp.swift
//  Reciplease
//
//  Created by Zidouni on 10/05/2023.
//

import SwiftUI

@main
struct RecipleaseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
           TabBarView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
