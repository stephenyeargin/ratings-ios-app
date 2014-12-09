//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by Stephen Yeargin on 12/8/14.
//  Copyright (c) 2014 Stephen Yeargin. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {

    var player:Player!
    
    var game:String = "Chess"
    var rating:String = "3"
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var ratingDetailLabel: UILabel!

    @IBAction func selectedGame(segue:UIStoryboardSegue) {
        let gamePickerViewController = segue.sourceViewController as GamePickerViewController
        if let selectedGame = gamePickerViewController.selectedGame {
            detailLabel.text = selectedGame
            game = selectedGame
        }
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func selectedRating(segue:UIStoryboardSegue) {
        let ratingPickerViewController = segue.sourceViewController as RatingPickerViewController
        if let selectedRating = ratingPickerViewController.selectedRating {
            ratingDetailLabel.text = selectedRating
            rating = selectedRating
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = game
        ratingDetailLabel.text = rating
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Make entire cell active for clicking
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text, game:game, rating: rating.toInt()!)
        }
        if segue.identifier == "SelectGame" {
            let gamePickerViewController = segue.destinationViewController as GamePickerViewController
            gamePickerViewController.selectedGame = game
        }
        if segue.identifier == "SelectRating" {
            let ratingPickerViewController = segue.destinationViewController as RatingPickerViewController
            ratingPickerViewController.selectedRating = rating
        }
        
    }
    
    // Debugging methods
    required init(coder aDecoder: NSCoder) {
        println("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        println("deinit PlayerDetailsViewController")
    }

}
