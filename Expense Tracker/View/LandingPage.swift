//
//  LandingPage.swift
//  Expense Tracker
//
//  Created by Heet M. Ankola on 10/10/24.
//
import SwiftUI

struct LandingPage: View {
    @State private var offset: CGFloat = 0
    @State private var dragCompleted: Bool = false
    @State private var navigate: Bool = false // State variable for programmatic navigation
    @State private var boxExpanded: Bool = false // To track whether the white box is expanding
    
    var body: some View {
        NavigationStack {
            ZStack {

                Color(UIColor.systemYellow).edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Pie chart illustration placeholder
                    Image(systemName: "chart.pie.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 50)
                    
                    Spacer()
                    
                    // Bottom white background with swipe area
                    ZStack(alignment: .center) {
                        // White background covering bottom area or expanding to full screen
                        RoundedRectangle(cornerRadius: boxExpanded ? 0 : 30)
                            .fill(Color.white)
                            .frame(height: boxExpanded ? 1200 : 350)
                            .shadow(radius: 10)
                            .padding(.horizontal, boxExpanded ? 0 : 20)
                            .offset(y: 40)
                            .animation(.easeInOut(duration: 0.4), value: boxExpanded)
                        
                        if !boxExpanded {
                            Text("Manage your daily life expenses")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 160)
                            
                            // Subtext: Description of the app
                            Text("Expense Tracker is a simple and efficient personal finance management app that allows you to track your daily expenses and income.")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                                .padding(.top, 20)
                            
                            VStack {
                                // Capsule container with swipe instruction and draggable button
                                ZStack {
                                    // Capsule background
                                    Capsule()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: 300, height: 60)
                                    
                                    // Swipe instruction text
                                    HStack {
                                        Text("Swipe to start")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                            .padding(.leading, 110)
                                        
                                        Spacer()
                                    }
                                    
                                    // Draggable round button with animation
                                    HStack {
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 50, height: 50)
                                            .offset(x: offset)
                                            .padding(.leading, 30)
                                            .gesture(
                                                DragGesture()
                                                    .onChanged { gesture in
                                                        // Animate the dragging action
                                                        withAnimation(.easeOut(duration: 0.2)) {
                                                            if gesture.translation.width >= 0 && gesture.translation.width <= 200 {
                                                                self.offset = gesture.translation.width
                                                            }
                                                        }
                                                    }
                                                    .onEnded { _ in
                                                        // Check if the swipe was successful
                                                        withAnimation(.easeInOut(duration: 0.5)) {
                                                            if offset > 150 {
                                                                // Mark drag as completed and trigger white box expansion
                                                                self.dragCompleted = true
                                                                self.boxExpanded = true // Trigger the white box to expand
                                                                
                                                                // Programmatically trigger navigation
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                                                    navigate = true
                                                                }
                                                            } else {
                                                                // Reset offset if swipe was not completed
                                                                offset = 0
                                                            }
                                                        }
                                                    }
                                            )
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 20.0)
                                }
                            }
                            .offset(y: 140)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Navigation to HomeScreen using .navigationDestination
                .navigationDestination(isPresented: $navigate) {
                    HomeScreen(userId: "1")
                    EmptyView()
                }
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
