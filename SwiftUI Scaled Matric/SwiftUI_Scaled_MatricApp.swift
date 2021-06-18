//
//  SwiftUI_Scaled_MatricApp.swift
//  SwiftUI Scaled Matric
//
//  Created by innertainment on 2021/06/18.
//

import SwiftUI

@main
struct SwiftUI_Scaled_MatricApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
