//
//  CreateView.swift
//  CrudPractice4
//
//  Created by Terrell Payne on 1/28/24.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var item = ToDoItem()
    
    var body: some View {
        List{
            TextField("Name", text: $item.title)
            DatePicker("Choose a date", selection: $item.timeStamp)
            Toggle("Important", isOn: $item.isComplete)
            Button("Create"){
                withAnimation{
                    context.insert(item)
                }
                dismiss()
            }
        }
        .navigationTitle("Create ToDo")
    }
}

#Preview {
    CreateView()
}
