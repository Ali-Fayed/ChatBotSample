//
//  ChatBotSampleApp.swift
//  ChatBotSample
//
//  Created by Ali Fixed on 12/10/2022.
//

import SwiftUI

@main
struct ChatBotSampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
