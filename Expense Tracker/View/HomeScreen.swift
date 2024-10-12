//
//  HomeScreen.swift
//  Expense Tracker
//
//  Created by Heet M. Ankola on 10/10/24.
//
import SwiftUI

struct HomeScreen: View {
    @State private var taskProgress: Double = 0.0
    @StateObject private var viewModel = ExpenseViewModel()
    @StateObject private var userModel = UserViewModel()
    var userId: String
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all);
            VStack{
                HStack{
                    Text("Hi, There!")
                        .font(.largeTitle)
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        // Action for the profile icon can be added here
                        print("clicked")
                    }) {
                        Circle()
                            .fill(Color.blue) // Circle color (can be changed or omitted)
                            .frame(width: 40, height: 40) // Size of the circle
                            .overlay(
                                Image("avatar") // Your avatar image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle()) // Ensures the image is circula
                                    .frame(width: 40, height: 40) // Size of the image
                            )
                    }
                        .padding()
                }
                .padding()
                HStack{
                    VStack{
                        HStack{
                            CircularProgressBar(progress: userModel.getDailyMax())
                            Spacer()
                            VStack{
                                Text("Todays")
                                    .padding(.bottom,10.0)
                                Text("$\(viewModel.totalExpenses, specifier: "%.2f")")
                                
                            }
                        }
                        .padding()
                    }
                    Divider()
                    VStack{
                        HStack{
                            CircularProgressBar(progress: userModel.getDailyMax())
                            Spacer()
                            VStack{
                                Text("Monthly")
                                    .padding(.bottom,10.0)
                                Text("80")
                            }
                        }
                            .padding()
                    }
                    
                }
                .frame(width: .infinity, height: 100)
                Spacer()
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            viewModel.fetchExpenses(for: userId)
            userModel.fetchUsers(for: userId)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(userId: "1")
    }
}
