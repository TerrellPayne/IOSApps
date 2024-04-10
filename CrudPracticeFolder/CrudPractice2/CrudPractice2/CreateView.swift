//
//  CreateView.swift
//  CrudPractice2
//
//  Created by Terrell Payne on 1/20/24.
//

import SwiftUI

struct CreateToDoView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var item = ToDoItem()
    
    var body: some View {
        List {
            TextField("Name", text: $item.title)
            DatePicker("Choose a date", selection: $item.timestamp)
            Toggle("Important", isOn: $item.isCritical)
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
    CreateToDoView()
        .modelContainer(for: ToDoItem.self)
}
