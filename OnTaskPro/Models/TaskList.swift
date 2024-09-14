//
//  TaskList.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 7/9/2024.
//

import Foundation

class TaskList : ObservableObject {
    @Published var List: [Task] = [
        Task(id: UUID(), taskName: "Study for Math Exam", dueDate: Date().addingTimeInterval(86400 * 2)),
        Task(id: UUID(), taskName: "Complete History Assignment", dueDate: Date().addingTimeInterval(86400 * 3)),
        Task(id: UUID(), taskName: "Prepare English Presentation", dueDate: Date().addingTimeInterval(86400 * 5)),
        Task(id: UUID(), taskName: "Finish Science Lab Report", dueDate: Date().addingTimeInterval(86400 * 7)),
        Task(id: UUID(), taskName: "Work on Art Project", dueDate: Date().addingTimeInterval(86400 * 18)),
        Task(id: UUID(), taskName: "Study for Geography Quiz", dueDate: Date().addingTimeInterval(86400 * 21)),
        Task(id: UUID(), taskName: "Plan Weekly Schedule", dueDate: Date().addingTimeInterval(86400 * 23)),
        Task(id: UUID(), taskName: "Reduce Screen Time", dueDate: Date().addingTimeInterval(86400 * 24)),
        Task(id: UUID(), taskName: "Write Reflection on Study Habits", dueDate: Date().addingTimeInterval(86400 * 26)),
        Task(id: UUID(), taskName: "Complete Practice Test", dueDate: Date().addingTimeInterval(86400 * 30))
    ]
    
    func addTask(NewTask :Task) {
        List.append(NewTask)
    }
    
    func removeTask(task: Task) {
        if let index = List.firstIndex(where: { $0.id == task.id }) {
            List.remove(at: index)
        }
    }
    
    
}
