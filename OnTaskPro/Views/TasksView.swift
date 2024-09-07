//
//  TasksView.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 3/9/2024.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Tasks")
                    .font(.system(size: 60))
                Spacer()
            }
            .padding(20)
            Spacer()
        }
    }
}

#Preview {
    TasksView()
}
