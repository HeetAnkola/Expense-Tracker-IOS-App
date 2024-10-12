//
//  ExpenseViewModel.swift
//  Expense Tracker
//
//  Created by Heet M. Ankola on 11/10/24.
//


// ViewModels/ExpenseViewModel.swift
import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []
    @Published var totalExpenses: Double = 0.0
    
    func fetchExpenses(for userId: String) {
        APIService.shared.fetchExpenses(for: userId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let expenses):
                    self.expenses = expenses
                    APIDataStore.shared.updateExpenses(expenses)
                    self.calculateTotalExpenses()
                case .failure(let error):
                    print("Error fetching expenses: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func calculateTotalExpenses() {
        totalExpenses = expenses.reduce(0) { $0 + $1.amount }
    }
    
    func calculateAverageExpense() -> Double {
        guard !expenses.isEmpty else { return 0 }
        return totalExpenses / Double(expenses.count)
    }
}
