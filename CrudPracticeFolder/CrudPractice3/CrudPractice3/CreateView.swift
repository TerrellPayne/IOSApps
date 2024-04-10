//
//  CreateView.swift
//  CrudPractice3
//
//  Created by Terrell Payne on 1/21/24.
//

import SwiftUI

struct CreateToDoView: View {
    @Environment (\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var item = ToDoItem()
    var body: some View {
        List {
            TextField("Name", text: $item.title)
            DatePicker("Choose a Date", selection: $item.timestamp)
            Toggle("Impotant", isOn: $item.isCritical)
            Button("Create") {
                withAnimation {
                    context.insert(item)
                }
                dismiss()
            }
        }
        .navigationTitle("Create ToDo")
        
    }
    
}

#Preview {
    CreateToDoView().modelContainer(for: ToDoItem.self)
}
