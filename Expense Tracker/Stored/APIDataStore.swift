//
//  APIDataStore.swift
//  Expense Tracker
//
//  Created by Heet M. Ankola on 12/10/24.
//


import Foundation

class APIDataStore {
    static let shared = APIDataStore()
    
    private init() { }
    
    // Properties to store API response
    var userDetails: [String: Any] = [:]
    var expenses: [Expense] = []
    
    // Methods to update or retrieve data
    func updateUserDetails(_ details: [String: Any]) {
        userDetails = details
    }
    
    func getUserDetails() -> [String: Any] {
        return userDetails
    }
    
    func updateExpenses(_ expenseList: [Expense]) {
        expenses = expenseList
    }
    
    func getTotalExpenses() -> Double {
        return expenses.reduce(0) { $0 + $1.amount }
    }
    
    func getExpenses() -> [Expense] {
        return expenses
    }
}
