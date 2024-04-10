//
//  CrudPractice3App.swift
//  CrudPractice3
//
//  Created by Terrell Payne on 1/21/24.
//

import SwiftUI

@main
struct CrudPractice3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
