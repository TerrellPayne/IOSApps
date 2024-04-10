//
//  ContentView.swift
//  CrudPractice3
//
//  Created by Terrell Payne on 1/21/24.
//

import SwiftUI
import SwiftData
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
                    HStack{
                        VStack(alignment: .leading) {
                            if item.isCritical {
                                Image(systemName: "exclamationmark.2")
                                    .foregroundColor(.blue)
                            }
                            Text(item.title)
                            
                            Text("\(item.timestamp,format: Date.FormatStyle(date: .numeric, time: .shortened))").font(.callout)
                        }
                        Spacer()
                        
                        Button {
                            withAnimation {
                                item.isCompleted.toggle()
                            }
                        } label: {
                            Image(systemName: "checkmark")
                                .foregroundColor(item.isCompleted ? .green : .gray)
                        }
                        .buttonStyle(.plain)
                    }
                    .swipeActions {
                        Button (role: .destructive) {
                            withAnimation {
                                context.delete(item)
                        }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.brown)
                        
                        Button {
                            toDoToEdit = item
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.yellow)
                }
             }
                    
            }
            .navigationTitle("My ToDo List")
            .toolbar {
                ToolbarItem {
                    Button( action: {
                        showCreate.toggle()
                    }, label: {
                        Label ("Add Item", systemImage: "multiply")
                    })
                }
            }
            .sheet(isPresented: $showCreate, content: {
                NavigationStack {
                    CreateToDoView()
                }
                .presentationDetents([.medium])
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
