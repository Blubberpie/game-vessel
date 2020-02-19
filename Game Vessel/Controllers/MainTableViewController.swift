//
//  MainTableViewController.swift
//  Game Vessel
//
//  Created by blubberpie on 19/02/2020.
//  Copyright © 2020 blubberpie. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    let apiService = APIService()
    var games: [Game]?
    var selectedGame: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        apiService.fetchGames(completionHandler: reloadTable(games:))
    }
    
    func reloadTable(games: [Game]){
        self.games = games
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
    
    // Send to detail view on click
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameDetailViewController = segue.destination as? GameDetailViewController else {
            return
        }
        
        gameDetailViewController.game = selectedGame
    }
    
    
    
    
}

extension MainTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as? GameTableViewCell else {
            return UITableViewCell()
        }
        
        guard let game = games?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.gameNameLabel.text = game.name
        cell.setGameBackgroundImage(urlString: game.backgroundImage)
        cell.gameReleaseDateLabel.text = game.released
        return cell
    }
}

extension MainTableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let gamesArray = games else {
            return indexPath
        }
        selectedGame = gamesArray[indexPath.row]
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}
