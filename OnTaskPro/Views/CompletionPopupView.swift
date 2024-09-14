//
//  CompletionPopupView.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 14/9/2024.
//

import SwiftUI

struct CompletionPopupView: View {
    var selectedTask: Task?
    var onDismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("🎉")
                .font(.system(size: 120))
            
            Text("Congratulations!")
                .font(.largeTitle)
                .bold()
            
            Text("You completed your focus session")
                .font(.title2)
            
            if let task = selectedTask {
                Text(task.taskName)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            Button(action: onDismiss) {
                Text("OK")
                    .foregroundColor(.white)
                    .padding()
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    CompletionPopupView(selectedTask: Task(id: UUID(), taskName: "Study for Math", dueDate: Date()), onDismiss: {})
}
