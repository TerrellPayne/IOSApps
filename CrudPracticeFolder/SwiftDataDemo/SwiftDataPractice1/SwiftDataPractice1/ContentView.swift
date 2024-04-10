//
//  ContentView.swift
//  SwiftDataPractice1
//
//  Created by Terrell Payne on 2/18/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @State private var toDoEdit: DataItem?
    @Query private var items: [DataItem]
    
    var body: some View {
        VStack {
            Text("Tap on this button to add date")
            Button("Add an item") {
                addItem()
            }
            NavigationStack{
            List {
                ForEach(items) { item in
                    VStack {
                        Text(item.name)
                        Text(item.id)
                    }
                    .swipeActions{
                        Button {
                            toDoEdit = item
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        Button(role: .destructive){
                            withAnimation{
                                deleteItem(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
//                .onDelete { indexes in
//                    for index in indexes {
//                        deleteItem(items[index])
//                    }
//                    
//                }
            }
            .sheet(item: $toDoEdit){
                toDoEdit = nil
            } content: { item in
                UpdateDataItemView(item: item)
                
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
        item.name = "updated item"
    }
}

#Preview {
    ContentView()
}
