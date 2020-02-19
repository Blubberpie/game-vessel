//
//  GameDetailViewController.swift
//  Game Vessel
//
//  Created by blubberpie on 19/02/2020.
//  Copyright © 2020 blubberpie. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {

    var game: Game?
    
    @IBOutlet weak var gameBackgroundImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var redditUrlLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populate()
    }
    
    func populate(){
        guard let game = game else {
            return
        }
        setGameBackgroundImage(urlString: game.background_image)
        gameNameLabel.text = game.name
        releaseDateLabel.text = game.released
//        gameDescriptionLabel.text = game.description
        gameDescriptionLabel.text = game.name
//        ratingLabel.text = String(game.rating)
        websiteLabel.text = game.name
        redditUrlLabel.text = game.name
    }
    
    func setGameBackgroundImage(urlString: String){
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: url!)
        gameBackgroundImageView.image = UIImage(data: data!)
    }

}
