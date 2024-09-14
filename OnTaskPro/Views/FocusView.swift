//
//  FocusView.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 3/9/2024.
//

import SwiftUI

struct FocusView: View {
    
    @ObservedObject var tasklist: TaskList
    @State private var selectedTask: Task? = nil
    @State private var selectedDuration: Int = 15
    @State private var remainingTime: Int = 0
    @State private var isTimerRunning = false
    @State private var isShowingStartFocusView = false
    @State private var isShowingCompletionPopup = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack {
            
            // Title
            HStack {
                Text("Focus")
                    .font(.system(size: 60))
                Spacer()
            }
            .padding(20)
            
            // Task Status
            if let task = selectedTask {
                HStack {
                    Text("\(task.taskName)")
                        .font(.system(size: 30))
                        .bold()
                    .padding(20)
                    Spacer()
                }
                
                // Display the countdown timer if the timer is running
                if isTimerRunning {
                    Text("Remaining Time: \(timeFormatted(remainingTime))")
                        .font(.largeTitle)
                        .fixedSize()
                        .padding(.bottom, 20)
                    
                    // Progress Bar
                    ProgressBar(progressBarWidth: progressBarWidth, totalWidth: UIScreen.main.bounds.width * 0.85)
                        .padding(.bottom, 20)
                    
                    Spacer()
                    
                    // Button to stop the timer
                    Button(action: {
                        stopTimer()
                    }) {
                        Text("Stop Focus Session")
                            .foregroundColor(.white)
                            .padding()
                            .font(.system(size: 24))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                }
                
                if !isTimerRunning {
                    // Button to start the countdown
                    Button(action: {
                        startTimer()
                    }) {
                        Text("Start Focus Session")
                            .foregroundColor(.white)
                            .padding()
                            .font(.system(size: 24))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                }
                
            } else {
                
                Spacer()
                Text("No task selected")
                    .font(.title2)
                    .padding(.bottom, 10)
                
                Spacer()
                
                // Button to open SetupFocusView
                Button(action: {
                    isShowingStartFocusView = true
                }) {
                    Text("Set Up Focus Session")
                        .foregroundColor(.white)
                        .padding()
                        .font(.system(size: 24))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.orange)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .sheet(isPresented: $isShowingStartFocusView) {
            SetupFocusView(
                tasklist: tasklist,
                selectedTask: $selectedTask,
                selectedDuration: $selectedDuration
            )
        }
        .sheet(isPresented: $isShowingCompletionPopup) {
            CompletionPopupView(selectedTask: selectedTask) {
                isShowingCompletionPopup = false
            }
            .padding()
        }
    }
    
    // Format time to show minutes and seconds
    func timeFormatted(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    // Calculate the width of the progress bar based on remaining time
    var progressBarWidth: CGFloat {
        let totalSeconds = selectedDuration * 60
        guard totalSeconds > 0 else { return 0 }
        let progress = CGFloat(totalSeconds - remainingTime) / CGFloat(totalSeconds)
        return progress
    }
    
    // Start the countdown timer
    func startTimer() {
        remainingTime = selectedDuration * 60 // Convert minutes to seconds
        if remainingTime > 0 && !isTimerRunning {
            isTimerRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if remainingTime > 0 {
                    remainingTime -= 1
                } else {
                    stopTimer() // Stop timer when countdown is complete
                    isShowingCompletionPopup = true
                }
            }
        }
    }
    
    // Stop the countdown timer and reset the view
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
        remainingTime = 0
        tasklist.removeTask(task: selectedTask!)
        selectedTask = nil
    }

}

#Preview {
    FocusView(tasklist: TaskList())
}
