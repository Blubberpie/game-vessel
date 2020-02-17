//
//  DetailViewController.swift
//  Project
//
//  Created by epita on 17/02/2020.
//  Copyright © 2020 epita. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var user: User?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateInfo()
    }
    
    func populateInfo(){
        guard let user = user else {
            return
        }
        nameLabel.text = "\(user.name.first) \(user.name.last.uppercased())"
    }

}
