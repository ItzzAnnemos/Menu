//
//  MenuApp.swift
//  Menu
//
//  Created by Nikola Serafimov on 5.3.26.
//

import SwiftUI

@main
struct MenuApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
