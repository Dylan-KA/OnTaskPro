

import SwiftUI

struct BottomBar: View {
    
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

            TasksView()
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
    BottomBar()
}


