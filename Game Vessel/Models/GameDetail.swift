//
//  GameDetail.swift
//  Game Vessel
//
//  Created by epita on 19/02/2020.
//  Copyright © 2020 blubberpie. All rights reserved.
//

import Foundation

class GameDetail: Codable {
    let id: Int
    let name: String
    let released: String
    let background_image: String
    let description: String
    let website: String
    let rating: Float
    let redditUrl: String
}
