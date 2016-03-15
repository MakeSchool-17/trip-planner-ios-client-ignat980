//
//  CoreDataClient.swift
//  Ignat-Trip-Planner
//
//  Created by Ignat Remizov on 10/30/15.
//  Copyright © 2015 Ignat Remizov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataClient {

    var managedObjectContext: NSManagedObjectContext
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func allTrips() -> [Trip] {
        let fetchRequest = NSFetchRequest(entityName: "Trip")
        let trips = try! managedObjectContext.executeFetchRequest(fetchRequest) as! [Trip]
    
        return trips
    }
    
}