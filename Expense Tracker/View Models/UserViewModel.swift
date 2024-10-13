//
//  UserViewModel.swift
//  Expense Tracker
//
//  Created by Heet M. Ankola on 11/10/24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: [String: Any] = [:]
    private var viewModel = ExpenseViewModel()
    
    func fetchUsers(for userId: String) {
        APIService.shared.fetchUserDetails(for: userId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self.user = users
                    APIDataStore.shared.updateUserDetails(users)
                case .failure(let error):
                    print("Error fetching User: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    func getDailyMax() -> Double {
//        print(user["dailyMax"] as! Double)
        if let userDetails = user["user"] as? [String : Any]{
            
            // Ensure expenses are fetched before calculating daily max
            let expense = APIDataStore.shared.getTotalExpenses()
            
            // Check if expenses are valid before dividing
            guard let userDailyMax = userDetails["dailyMax"] as? Double, userDailyMax > 0 else {
                print("No valid dailyMax found for user \(user)")
                return 0
            }
            
//            print("Total Expenses: \(expense)")
            
            // If the expenses are valid, return daily max based on expenses
            return expense.isNaN ? 0 : expense / userDailyMax
        }
        return 0.0
    }
}
