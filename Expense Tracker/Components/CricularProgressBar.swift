//
//  CricularProgressBar.swift
//  Expense Tracker
//
//  Created by Heet M. Ankola on 10/10/24.
//

import SwiftUI

struct CircularProgressBar: View {
     var progress: Double // Progress value (0.0 to 1.0)

    var body: some View {
        ZStack {
            // Background Circle (for the unfilled part)
            Circle()
                .stroke(lineWidth: 7)
                .opacity(0.3)
                .foregroundColor(Color.gray)
            
            // Foreground Circle (for the filled part)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(
                    style: StrokeStyle(
                        lineWidth: 7,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .foregroundColor(Color.blue)
                .rotationEffect(Angle(degrees: 270)) // Start the progress from top
                .animation(.linear, value: progress)
        }
        .frame(width: 70, height: 70) // Size of the progress bar
        .padding(.leading,10)
    }
}
