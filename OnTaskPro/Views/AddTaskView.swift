//
//  AddTaskView.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 13/9/2024.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject var tasklist: TaskList
    @State private var newTaskName: String = ""
    @State private var newTaskDueDate: Date = Date()
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Add New Task")
                .font(.system(size: 54))
                .foregroundColor(.black)
                .padding()
            
            TextField("Enter task name", text: $newTaskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                        
            DatePicker("Due Date", selection: $newTaskDueDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(height: 400) 
                .padding(.horizontal)
            
            Spacer()
            
            // Add Task Button
            Button(action: {
                addTask()
            }) {
                Text("Add Task")
                    .foregroundColor(.white)
                    .padding()
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Cancel Button
            Button(action: {
                dismiss()
            }) {
                Text("Cancel")
                    .foregroundColor(.white)
                    .padding()
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.red)
                    .cornerRadius(12)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Invalid Input"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    // Function to add a new task to the task list
    func addTask() {
        if newTaskName.trimmingCharacters(in: .whitespaces).isEmpty {
            alertMessage = "Task name cannot be empty. Please enter a valid task name."
            showAlert = true
        } else {
            let newTask = Task(id: UUID(), taskName: newTaskName, dueDate: newTaskDueDate)
            tasklist.List.append(newTask)
            dismiss() // Dismiss the sheet after adding the task
        }
    }
}

#Preview {
    AddTaskView(tasklist: TaskList()) // Preview with a dummy TaskList
}
