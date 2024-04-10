//
//  ContentView.swift
//  CrudPractice4
//
//  Created by Terrell Payne on 1/28/24.
//

import SwiftUI
import  SwiftData
struct ContentView: View {
    @Environment(\.modelContext) var context
    @State private var showCreate = false
    
    @State private var toDoToEdit: ToDoItem?
    
    @Query()
    private var items: [ToDoItem]
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    HStack {
                        VStack  {
                            Text(item.title)
                            Text("\(item.timeStamp)")
                        }
                        Spacer()
                        
                        Button {
                            withAnimation {
                                item.isComplete.toggle()
                            }
                        } label: {
                            Image(systemName: "checkmark")
                        }
                        .buttonStyle(.plain)
                    }
                    .swipeActions{
                        Button(role: .destructive){
                            withAnimation{
                                context.delete(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        
                        Button {
                            toDoToEdit = item
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                      
                    }
                }
            }
            
            .navigationTitle("My toDo's")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showCreate.toggle()
                    }, label: {
                        Label("Add Item", systemImage: "plus")
                    })
                }
            }
            .sheet(isPresented: $showCreate, content: {
                NavigationStack{
                    CreateView()
                }
            })
            .sheet(item: $toDoToEdit) {
                toDoToEdit = nil
            } content: { item in
                UpdateToDoView(item: item)
            }
        }
    }
}

#Preview {
    ContentView()
}
