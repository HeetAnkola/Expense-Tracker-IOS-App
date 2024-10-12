//
//  APIService.swift
//  Expense Tracker
//
//  Created by Heet M. Ankola on 11/10/24.
//


// Services/APIService.swift
import Foundation

class APIService {
    static let shared = APIService() // Singleton pattern for global access
    
    func fetchExpenses(for userId: String, completion: @escaping (Result<[Expense], Error>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/api/expense/user/daily?userId=\(userId)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let expenses = try JSONDecoder().decode([Expense].self, from: data)
                completion(.success(expenses))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchUserDetails(for userId: String, completion: @escaping (Result<[String: Any],Error>)->Void){
        guard let url = URL(string: "http://localhost:8080/api/users/details?userId=\(userId)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                // Convert the data to a dictionary
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    completion(.success(json))
                } else {
                    completion(.failure(NSError(domain: "Invalid data format", code: 0, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
