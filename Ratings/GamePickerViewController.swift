//
//  GamePickerViewController.swift
//  Ratings
//
//  Created by Stephen Yeargin on 12/8/14.
//  Copyright (c) 2014 Stephen Yeargin. All rights reserved.
//

import UIKit

class GamePickerViewController: UITableViewController {

    var selectedGame:String? = nil
    var selectedGameIndex:Int? = nil
    var games:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        games = ["Angry Birds",
            "Chess",
            "Russian Roulette",
            "Spin the Bottle",
            "Texas Hold'em Poker",
            "Tic-Tac-Toe"]
        if let game = selectedGame {
            selectedGameIndex = find(games, game)!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = games[indexPath.row]
        
        if indexPath.row == selectedGameIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedGameIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedGameIndex = indexPath.row
        selectedGame = games[indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveSelectedGame" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            selectedGameIndex = indexPath?.row
            if let index = selectedGameIndex {
                selectedGame = games[index]
            }
        }
    }

}
