//
//  MyToDosApp.swift
//  MyToDos
//
//  Created by Terrell Payne on 1/1/24.
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
