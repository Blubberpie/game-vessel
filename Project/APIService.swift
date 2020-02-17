//
//  APIService.swift
//  Project
//
//  Created by epita on 17/02/2020.
//  Copyright © 2020 epita. All rights reserved.
//

import Foundation

class APIService {
    let urlString: String = "https://randomuser.me/api/?results=10"
    
    func fetchUsers(completionHandler: @escaping ([User]) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        // URLSession.shared is a singleton
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let data = data, let userResults = try? JSONDecoder().decode(UserResult.self, from: data) {
                let array = userResults.results
                completionHandler(array)
            }
        })
        
        task.resume()
    }
}
