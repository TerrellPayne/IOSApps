//
//  ContentView.swift
//  CrudPractice2
//
//  Created by Terrell Payne on 1/19/24.
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
                    HStack {
                        VStack(alignment: .leading ) {
                            if item.isCritical {
                                Image(systemName: "exclamationmark.3")
                                    .foregroundColor(.orange)
                            }
                            Text(item.title)
//                                .font(.largeTitle)
//                                .bold()
                            Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))").font(.callout)
                        }
                        Spacer()
                        
                        Button {
                            withAnimation {
                                item.isCompleted.toggle()
                            }
                        } label: {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundStyle(item.isCompleted ? .green : .gray)
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                        
                    }
                    .swipeActions {
                        Button (role: .destructive) {
                            withAnimation{
                                context.delete(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        }
                        
                        Button {
                            toDoToEdit = item
                        } label: {
                            Label("Edit", systemImage: "pencil")
                      }
                        .tint(.purple)
                    }
                }
            }
            .navigationTitle("My To Do List")
            .toolbar {
                ToolbarItem {
                    Button( action: {
                        showCreate.toggle()
                    }, label: {
                        Label ("Add Item", systemImage: "plus")
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
