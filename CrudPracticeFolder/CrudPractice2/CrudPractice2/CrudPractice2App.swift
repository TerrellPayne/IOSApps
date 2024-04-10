//
//  CrudPractice2App.swift
//  CrudPractice2
//
//  Created by Terrell Payne on 1/19/24.
//

import SwiftUI
import SwiftData

@main

struct MyToDosApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}

