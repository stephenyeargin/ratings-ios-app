//
//  RatingPickerViewController.swift
//  Ratings
//
//  Created by Stephen Yeargin on 12/8/14.
//  Copyright (c) 2014 Stephen Yeargin. All rights reserved.
//

import UIKit

class RatingPickerViewController: UITableViewController {

    var selectedRating:String? = nil
    var selectedRatingIndex:Int? = nil
    var ratings:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratings = ["1",
            "2",
            "3",
            "4",
            "5"]
        if let rating = selectedRating {
            selectedRatingIndex = find(ratings, rating)!
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
        return ratings.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RatingCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = ratings[indexPath.row]
        
        if indexPath.row == selectedRatingIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedRatingIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedRatingIndex = indexPath.row
        selectedRating = ratings[indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveSelectedRating" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            selectedRatingIndex = indexPath?.row
            if let index = selectedRatingIndex {
                selectedRating = ratings[index]
            }
        }
    }

}
