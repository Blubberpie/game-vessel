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
    let baseUrlString: String = "https://api.rawg.io/api/games"
    
    func fetchGames(completionHandler: @escaping ([Game]?) -> Void) {
        guard let url = URL(string: baseUrlString + "?page_size=10") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print(error)
                completionHandler(nil)
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP response code: \(httpResponse.statusCode)")
            }
            if let data = data, let gameResults = try? JSONDecoder().decode(GameResult.self, from: data) {
                completionHandler(gameResults.results)
            } else {
                print("Failed to decode JSON!")
            }
        })
        
        task.resume()
    }
    
    func fetchGameDetails(gameID: Int, completionHandler: @escaping (GameDetail) -> Void) {
        guard let url = URL(string: baseUrlString + "/\(gameID)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let data = data, let gameDetail = try? JSONDecoder().decode(GameDetail.self, from: data) {
                completionHandler(gameDetail)
            } else {
                print("JSON fail!")
            }
        })
        
        task.resume()
    }
}
