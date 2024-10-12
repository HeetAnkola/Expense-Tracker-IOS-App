//
//  User.swift
//  Expense Tracker
//
//  Created by Heet M. Ankola on 11/10/24.
//

struct UserResponse: Codable {
    let user: User
}

struct User: Codable {
    let userId: Int
    let userName: String
    let dailyMax: Double
    let monthlyMax: Double
}
