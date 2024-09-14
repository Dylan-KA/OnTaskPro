

import SwiftUI

struct BottomBar: View {
    
    @ObservedObject var tasklist: TaskList
    
    var body: some View {

        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            FocusView()
                .tabItem {
                    Label("Focus", systemImage: "moon")
                }

            TasksView(tasklist: tasklist)
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    BottomBar(tasklist: TaskList())
}


