//
//  UserTableViewCell.swift
//  Project
//
//  Created by epita on 17/02/2020.
//  Copyright © 2020 epita. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImageView.layer.cornerRadius = posterImageView.frame.height / 2
        posterImageView.clipsToBounds = true
    }

    func setImageFor(urlString: String){
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: url!)
        posterImageView.image = UIImage(data: data!)
    }

}
