//
//  UpdateDataItemView.swift
//  SwiftDataPractice1
//
//  Created by Terrell Payne on 2/18/24.
//

import SwiftUI
import SwiftData

struct UpdateDataItemView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var item = DataItem()
    
    var body: some View {
        List {
            TextField("Name", text: $item.name)
            
            Button("Update"){
                dismiss()
            }
        }
        .navigationTitle("Update ToDo")
    }
}


