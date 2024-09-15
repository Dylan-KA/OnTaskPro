//
//  ContentView.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 3/9/2024.
//

import SwiftUI

class TabSelectionManager: ObservableObject {
    @Published var selectedTab: Int = 0
}


struct ContentView: View {
    
    @StateObject var tasklist = TaskList()
    @StateObject var tabSelectionManager = TabSelectionManager()
    @State private var selectedTask: Task? = nil
    
    var body: some View {
        
        TabView(selection: $tabSelectionManager.selectedTab) {
            HomeView(tasklist: tasklist, selectedTask: $selectedTask)
                .environmentObject(tabSelectionManager)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)

            TasksView(tasklist: tasklist, selectedTask: $selectedTask)
                .environmentObject(tabSelectionManager)
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }
                .tag(1)

            FocusView(tasklist: tasklist, selectedTask: $selectedTask)
                .environmentObject(tabSelectionManager)
                .tabItem {
                    Label("Focus", systemImage: "moon")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
