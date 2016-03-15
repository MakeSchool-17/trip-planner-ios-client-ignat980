//
//  JSONWaypoint.swift
//  Ignat-Trip-Planner
//
//  Created by Ignat Remizov on 10/30/15.
//  Copyright © 2015 Ignat Remizov. All rights reserved.
//

import Foundation
import Glass

struct JSONWaypoint: Decodable {
    let latitude: Double
    let longitude: Double
    let name: String
    
    init?(json: JSON) {
        self.latitude = "latidute" <~~ json
        self.longitude = "longitude" <~~ json
        self.name = "name" <~~ json
    }
}