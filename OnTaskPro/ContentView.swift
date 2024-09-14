//
//  ContentView.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 3/9/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var tasklist = TaskList()
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            TasksView(tasklist: tasklist)
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }

            FocusView()
                .tabItem {
                    Label("Focus", systemImage: "moon")
                }
        }
    }
}

#Preview {
    ContentView()
}
