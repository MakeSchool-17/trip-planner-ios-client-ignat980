//
//  Waypoint.swift
//  Ignat-Trip-Planner
//
//  Created by Ignat Remizov on 10/30/15.
//  Copyright © 2015 Ignat Remizov. All rights reserved.
//

import Foundation
import CoreData

class Waypoint: NSManagedObject {
    convenience init(context: NSManagedObjectContext) {
        let entityDescription = NSEntityDescription.entityForName("Waypoint", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }

    convenience init(context: NSManagedObjectContext, jsonWaypoint: JSONWaypoint) {
        let entityDescription = NSEntityDescription.entityForName("Waypoint", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    
        name = jsonWaypoint.name
        latitude = jsonWaypoint.latitude
        longitude = jsonWaypoint.logitude
    }
}