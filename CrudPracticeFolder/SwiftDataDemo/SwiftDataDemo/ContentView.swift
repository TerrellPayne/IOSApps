//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Terrell Payne on 2/13/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var items: [DataItem]
    
    
    var body: some View {
        VStack {
            Text("Tap on this button to add data")
            Button("Add an Item") {
                addItem()
            }
            List {
                ForEach(items) { item in
                
                    HStack {
                        Text(item.name)
                        Spacer()
                        Button {
                            updateItem(item)
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        }
                    }
                    
                }
                .onDelete { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                }
            }
        }
        .padding()
    }
    
    func addItem() {
        let item = DataItem(name: "Test")
        context.insert(item)
    }
    
    func deleteItem(_ item: DataItem) {
        context.delete(item)
    }
    
    func updateItem(_ item: DataItem) {
        item.name = "updated data"
       try? context.save()
    }
    
    
}

#Preview {
    ContentView()
}
