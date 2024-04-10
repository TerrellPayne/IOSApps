//
//  SwiftDataPractice1App.swift
//  SwiftDataPractice1
//
//  Created by Terrell Payne on 2/18/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataPractice1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: DataItem.self)
        }
        
    }
}
