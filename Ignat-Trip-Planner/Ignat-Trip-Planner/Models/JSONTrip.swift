//
//  JSONTrip.swift
//  Ignat-Trip-Planner
//
//  Created by Ignat Remizov on 10/30/15.
//  Copyright © 2015 Ignat Remizov. All rights reserved.
//

import Foundation
import Glass

struct JSONTrip: Decodable {
    let tripName: String
    let waypoint: [JSONWaypoint]
    
    init?(json: JSON) {
        self.tripName = "trip" <~~ json
    }
    
}