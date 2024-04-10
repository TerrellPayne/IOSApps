//
//  CrudPractice4App.swift
//  CrudPractice4
//
//  Created by Terrell Payne on 1/28/24.
//

import SwiftUI

@main
struct CrudPractice4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
