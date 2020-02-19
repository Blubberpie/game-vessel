//
//  GameTableViewCell.swift
//  Game Vessel
//
//  Created by blubberpie on 19/02/2020.
//  Copyright © 2020 blubberpie. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameBackgroundImageView: UIImageView!
    @IBOutlet weak var gameReleaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        gameBackgroundImageView.layer.cornerRadius = gameBackgroundImageView.frame.height / 10
        gameBackgroundImageView.clipsToBounds = true
    }

    func setGameBackgroundImage(urlString: String){
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: url!)
        gameBackgroundImageView.image = UIImage(data: data!)
    }
}
