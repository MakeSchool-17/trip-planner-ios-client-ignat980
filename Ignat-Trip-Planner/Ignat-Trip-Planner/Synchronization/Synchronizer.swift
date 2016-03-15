//
//  Synchronizer.swift
//  Ignat-Trip-Planner
//
//  Created by Ignat Remizov on 10/30/15.
//  Copyright © 2015 Ignat Remizov. All rights reserved.
//

import Foundation
import CoreData

typealias SynchronizerCallback = ([Trip]) -> Void

class Synchronizer {
    
    var managedObjectContext: NSManagedObjectContext!
    
    func sync() {
        
        var coreDataTrips: [Trip] = []
        
        APIClient().fetchTrips({ trips in
            trips?.forEach { tri in
                let trip = Trip(context: self.managedObjectContext, jsonTrip: tri)
                
                tri.waypoints?.forEach { wayp
                    let waypoint = Waypoint(context: self.managedObjectContext, jsonWaypoint: wayp)
                    waypoint.trip = trip
                }
                coreDataTrips.append(trip)
            }
        })
        
        try! self.managedObjectContext.save()
        SynchronizerCallback(coreDataTrips)
    }
}