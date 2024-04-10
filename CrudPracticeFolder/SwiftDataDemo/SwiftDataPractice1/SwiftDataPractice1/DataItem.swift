//
//  DataItem.swift
//  SwiftDataPractice1
//
//  Created by Terrell Payne on 2/18/24.
//

import Foundation
import SwiftData

@Model

final class DataItem {
    var id: String
    var name: String
    
    init( name: String = "") {
        self.id = UUID().uuidString
        self.name = name
    }
}
