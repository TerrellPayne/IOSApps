//
//  ToDoItem.swift
//  CrudPractice4
//
//  Created by Terrell Payne on 1/28/24.
//

import Foundation
import SwiftData

@Model

final class ToDoItem {
    var title: String
    var timeStamp: Date
    var isCritical: Bool
    var isComplete: Bool
    
    init(title: String = "", timeStamp: Date = .now, isCritical: Bool = false, isComplete: Bool = false) {
        self.title = title
        self.timeStamp = timeStamp
        self.isCritical = isCritical
        self.isComplete = isComplete
    }
}
