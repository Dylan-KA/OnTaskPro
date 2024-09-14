//
//  ProgressBar.swift
//  OnTaskPro
//
//  Created by Dylan Archer on 14/9/2024.
//

import SwiftUI

struct ProgressBar: View {
    var progressBarWidth: CGFloat
    var totalWidth: CGFloat
    var height: CGFloat = 50
    var cornerRadius: CGFloat = 10
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Background rounded rectangle (empty part of the progress bar)
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.gray.opacity(0.3))
                .frame(width: totalWidth, height: height)
            
            // Foreground rounded rectangle (filled part of the progress bar)
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.blue)
                .frame(width: min(totalWidth * progressBarWidth, totalWidth), height: height) 
                .animation(.linear, value: progressBarWidth) // Animate changes
        }
    }
}

