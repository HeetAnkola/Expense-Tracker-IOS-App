//
//  HomeScreen.swift
//  Expense Tracker
//
//  Created by Heet M. Ankola on 10/10/24.
//
import SwiftUI

struct HomeScreen: View {
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
                                                                                .clipShape(Circle()) // Ensures the image is circular
                                                                                .frame(width: 40, height: 40) // Size of the image
                                                                        )
                                        }
                                        .padding()
                }
                .padding()
                
                Spacer()
            }
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
