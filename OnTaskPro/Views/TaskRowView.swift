//
//  TaskRowView.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 13/9/2024.
//

import SwiftUI

struct TaskRowView: View {
    
    @Binding var task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.taskName)
                    .font(.headline)
                    .foregroundColor(.black) // Set task name color
                Text("Due: \(formattedDate(task.dueDate))")
                    .font(.subheadline)
                    .foregroundColor(determineColor(for: task.dueDate)) // Keep due date in gray
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(5)
    }
    
    // Helper function to format date
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    // Function to determine text color based on the due date
    func determineColor(for dueDate: Date) -> Color {
        let daysRemaining = Calendar.current.dateComponents([.day], from: Date(), to: dueDate).day ?? 0
        
        if daysRemaining < 3 {
            return .red
        } else if daysRemaining < 7 {
            return .orange
        } else {
            return .green
        }
    }
}

 #Preview {
     TasksView(tasklist: TaskList())
 }

