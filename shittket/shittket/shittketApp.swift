//
//  shittketApp.swift
//  shittket
//
//  Created by POS on 8/8/25.
//

import SwiftUI

@main
struct MyApp: App {
    @StateObject private var eventManager = EventManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(eventManager)
//            ContentListView()
        }
    }
}
