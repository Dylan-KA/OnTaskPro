//
//  HomeView.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 4/9/2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var tasklist: TaskList
    @EnvironmentObject var tabSelectionManager: TabSelectionManager
    @Binding var selectedTask: Task?
    
    var body: some View {
        VStack {
            HStack {
                Text("OnTaskPro")
                    .font(.system(size: 60))
                Spacer()
            }
            .padding(20)
            
            Image(systemName: "list.star")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .padding()
            
            VStack {
                HStack {
                    Text("Welcome back, you have \(tasklist.List.count)")
                        .font(.system(size: 24))
                    Spacer()
                }
                HStack {
                    Text("tasks remaining.")
                        .font(.system(size: 24))
                    Spacer()
                }
            }
            .padding()
            
            // Button to go to tasks
            Button(action: {
                tabSelectionManager.selectedTab = 1
            }) {
                Text("See all my tasks")
                    .foregroundColor(.white)
                    .padding()
                    .font(.system(size: 24))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.green)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
                    
            // Suggested Task
            if !tasklist.List.isEmpty {
                
                HStack {
                    Text("Here's a suggested task:")
                        .font(.system(size: 24))
                        .padding()
                    Spacer()
                }
                
                VStack {
                    TaskRowView(task: tasklist.List[0])
                        .onTapGesture {
                            selectedTask = tasklist.List[0]
                            tabSelectionManager.selectedTab = 2
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 2)
                                .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                        )
                        .padding(.horizontal)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
