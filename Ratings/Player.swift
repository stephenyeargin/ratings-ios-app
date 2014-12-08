//
//  Player.swift
//  Ratings
//
//  Created by Stephen Yeargin on 12/8/14.
//  Copyright (c) 2014 Stephen Yeargin. All rights reserved.
//

import Foundation
import UIKit

class Player: NSObject {
    var name: String
    var game: String
    var rating: Int
    
    init(name: String, game: String, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
        super.init()
    }
}