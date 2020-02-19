//
//  GameDetailViewController.swift
//  Game Vessel
//
//  Created by blubberpie on 19/02/2020.
//  Copyright © 2020 blubberpie. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {
    
    @IBOutlet weak var gameBackgroundImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var redditUrlLabel: UILabel!
    
    var apiService = APIService()
    var game: Game?
    var gameDetail: GameDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let game = game else {
            return
        }
        apiService.fetchGameDetails(gameID: game.id, completionHandler: reloadPage(gameDetail:))
    }
    
    func reloadPage(gameDetail: GameDetail){
        self.gameDetail = gameDetail
        DispatchQueue.main.async {
            self.populate()
            self.reloadInputViews()
        }
    }
    
    func populate(){
        guard let gameDetail = self.gameDetail else {
            return
        }
        setGameBackgroundImage(urlString: gameDetail.background_image)
        gameNameLabel.text = gameDetail.name
        releaseDateLabel.text = gameDetail.released
        gameDescriptionLabel.text = gameDetail.description
        ratingLabel.text = String(gameDetail.rating)
        websiteLabel.text = gameDetail.website
        redditUrlLabel.text = gameDetail.reddit_url
    }
    
    func setGameBackgroundImage(urlString: String){
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: url!)
        gameBackgroundImageView.image = UIImage(data: data!)
    }

}
