//
//  TasksView.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 3/9/2024.
//

import SwiftUI

struct TasksView: View {
    
    @ObservedObject var tasklist: TaskList
    @State private var searchText: String = ""
    @State private var isShowingAddTaskView = false
    @State private var sortOption: SortOption = .dueDate
        
    enum SortOption: String, CaseIterable, Identifiable {
        case dueDate = "Due Date"
        case alphabetical = "Alphabetical"
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        ZStack {
            Color.white // Background color
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Title
                HStack {
                    Text("Tasks")
                        .font(.system(size: 60))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(20)
                
                // Search Bar
                HStack {
                    Spacer()
                    Image(systemName: "magnifyingglass") // Search icon
                        .foregroundColor(.gray)
                    TextField("Search", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(10)
                }
                .background(Color.white)
                .cornerRadius(10)
                .overlay( // Add the gray outline using overlay
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal)
                
                HStack {
                    // Sorting Picker
                    Picker("Sort by", selection: $sortOption) {
                        ForEach(SortOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200) // Adjust the width as needed
                    .fixedSize() // Prevents the picker from stretching
                    
                    Spacer()
                    
                    // Button to show AddTaskView
                    Button(action: {
                        isShowingAddTaskView.toggle() // Show the Add Task sheet
                    }) {
                        Text("Add Task")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.blue)
                            .cornerRadius(10)

                    }
                }
                .padding()
                
                // Task List
                List {
                    ForEach(filteredAndSortedTasks) { task in
                        if let index = tasklist.List.firstIndex(where: { $0.id == task.id }) {
                            TaskRowView(task: $tasklist.List[index])
                        }
                    }
                }
                .scrollContentBackground(.hidden) // Ensure list background is transparent
            }
        }
        // Present the AddTaskView as a sheet
        .sheet(isPresented: $isShowingAddTaskView) {
            AddTaskView(tasklist: tasklist)
        }
    }
    
    // Computed property to filter tasks based on the search query
    var filteredTasks: [Task] {
        if searchText.isEmpty {
            return tasklist.List
        } else {
            return tasklist.List.filter { $0.taskName.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // Computed property to sort tasks based on the selected sorting option
    var filteredAndSortedTasks: [Task] {
        let filtered = filteredTasks
        switch sortOption {
        case .dueDate:
            return filtered.sorted { $0.dueDate < $1.dueDate }
        case .alphabetical:
            return filtered.sorted { $0.taskName.localizedCaseInsensitiveCompare($1.taskName) == .orderedAscending }
        }
    }
    
}

#Preview {
    TasksView(tasklist: TaskList())
}
