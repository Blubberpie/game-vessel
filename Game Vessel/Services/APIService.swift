//
//  APIService.swift
//  Project
//
//  Created by blubberpie on 17/02/2020.
//  Copyright © 2020 blubberpie. All rights reserved.
//

import Foundation

class APIService {
    
    // Query parameters:
    // - page = page number
    // - page_size = number of games to get
    // TODO (if possible): Randomize page numbers?
    let urlString: String = "https://api.rawg.io/api/games?page_size=1"
    
    func fetchGames(completionHandler: @escaping ([Game]) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print(error)
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP response code: \(httpResponse.statusCode)")
            }
            if let data = data, let gameResults = try? JSONDecoder().decode(GameResult.self, from: data) {
                let array = gameResults.results
                completionHandler(array)
            } else {
                print(String(decoding: data!, as: UTF8.self))
                print("Failed to decode JSON!")
            }
        })
        
        task.resume()
    }
}
