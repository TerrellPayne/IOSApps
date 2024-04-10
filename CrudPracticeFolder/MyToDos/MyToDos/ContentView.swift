//
//  ContentView.swift
//  MyToDos
//
//  Created by Terrell Payne on 1/1/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) var context
    
    @State private var showCreate = false
    @State private var toDoToEdit: ToDoItem?
    @Query(
        filter: #Predicate { (item: ToDoItem) in item.isCompleted == false },
        sort: \.timestamp,
        order: .reverse
    ) private var items: [ToDoItem]
    var body: some View {
        NavigationStack {
            List{
                ForEach(items) { item in    
                    HStack {
                        VStack(alignment: .leading ) {
                            if item.isCritical {
                                Image(systemName: "exclamationmark.3")
                                    .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.red)
                                    .font(.largeTitle)
                                    .bold()
                            }
                            Text(item.title)
                                .font(.largeTitle)
                                .bold()
                            Text("\(item.timestamp, format: Date.FormatStyle(date:.numeric, time: .shortened))").font(.callout)
                        }
                        Spacer()
                        
                        Button {
                            withAnimation{
                                item.isCompleted.toggle()
                            }
                        } label: {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(item.isCompleted ? .green : .gray)
                                .font(.largeTitle)
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
                                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        }
                        
                        Button {
                            toDoToEdit = item
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.orange)
                        
                    }
                }
            }
            .navigationTitle("My To Do List")
                .toolbar {
                    ToolbarItem{
                     Button(action: {
                         showCreate.toggle()
                     }, label: {
                         Label("Add Item", systemImage: "plus")
                     })
                    }
                }
                .sheet(isPresented: $showCreate, content: {
                    NavigationStack {
                        CreateTodoView()
                    }
                    .presentationDetents([.medium])
                })
                .sheet(item: $toDoToEdit){
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

