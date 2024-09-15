//
//  StartFocusView.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 14/9/2024.
//

import SwiftUI

struct SetupFocusView: View {
    
    @ObservedObject var tasklist: TaskList
    @Binding var selectedTask: Task?
    @Binding var selectedDuration: Int
    @State private var showAlert = false
    @State private var alertMessage: String = ""
    @Environment(\.dismiss) var dismiss
    
    // Array of timer options (in minutes)
    let timerOptions = [1, 5, 10, 15, 20, 30, 45, 60, 90, 120]
    
    var body: some View {
        VStack {
            
            // Title
            HStack {
                Text("Setup Focus Session")
                    .font(.system(size: 35))
                Spacer()
            }
            .padding(20)
            
            // Text Prompt
            Text("Choose a task to focus on")
                .font(.headline)
                .padding(.bottom, 10)
            
            // Task Picker Drop-down
            Picker("Select Task", selection: $selectedTask) {
                Text("None").tag(Task?.none) // Default empty option
                ForEach(tasklist.List) { task in
                    Text(task.taskName).tag(task as Task?)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .labelsHidden()
            .frame(maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.bottom, 20)
            
            // Timer Duration Picker
            Text("Select Focus Duration")
                .font(.headline)
            Picker("Select Timer", selection: $selectedDuration) {
                ForEach(timerOptions, id: \.self) { option in
                    Text("\(option) minutes").tag(option)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .labelsHidden()
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.bottom, 20)
            
            // Start Focus Session Button
            Button(action: {
                // Dismiss the StartFocusView once the task is selected
                if selectedTask != nil {
                    dismiss()
                } else {
                    alertMessage = "Please select a task to continue."
                    showAlert = true
                }
            }) {
                Text("Confirm Session")
                    .foregroundColor(.white)
                    .padding()
                    .font(.system(size: 24))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            
            Spacer()
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
}

#Preview {
    SetupFocusView(tasklist: TaskList(), selectedTask: .constant(nil), selectedDuration: .constant(15))
}
