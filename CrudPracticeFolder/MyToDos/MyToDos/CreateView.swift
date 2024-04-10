//
//  CreateView.swift
//  MyToDos
//
//  Created by Terrell Payne on 1/1/24.
//

import SwiftUI

struct CreateTodoView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var item = ToDoItem()
    
    var body: some View {
        List {
            TextField("Name", text: $item.title)
            DatePicker("Choose a date", selection: $item.timestamp)
            Toggle("Important", isOn: $item.isCritical)
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

//struct CreateView_Previews: PreviewProvider {
  //  static var previews: some View {
   //     CreateTodoView().modelContainer(for: ToDoItem.self)
    //}
//}
#Preview {
    CreateTodoView()
        .modelContainer(for: ToDoItem.self)
}


