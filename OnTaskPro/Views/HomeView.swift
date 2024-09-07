//
//  HomeView.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 4/9/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Home")
                    .font(.system(size: 60))
                Spacer()
            }
            .padding(20)
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
