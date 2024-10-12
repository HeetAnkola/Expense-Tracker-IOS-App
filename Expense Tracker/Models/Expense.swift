//
//  Expense.swift
//  Expense Tracker
//
//  Created by Heet M. Ankola on 11/10/24.
//

struct Expense: Codable, Identifiable {
    let id: Int
    let title: String
    let amount: Double
    let date: String
    
}
