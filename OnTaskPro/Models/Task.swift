//
//  Task.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 7/9/2024.
//

import Foundation

struct Task: Identifiable, Hashable {
    var id: UUID
    var taskName: String
    var dueDate: Date
}
