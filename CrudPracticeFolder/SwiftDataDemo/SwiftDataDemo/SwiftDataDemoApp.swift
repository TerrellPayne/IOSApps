//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by Terrell Payne on 2/13/24.
//

import SwiftUI
import SwiftData
@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataItem.self)
    }
}
