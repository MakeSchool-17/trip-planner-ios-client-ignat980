

//
//  ViewController.swift
//  Ignat-Trip-Planner
//
//  Created by Ignat Remizov on 10/30/15.
//  Copyright © 2015 Ignat Remizov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var trips: [Trip] = []
    var coreDataStack = CoreDataStack(stackType: .SQLite)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
//        Syncronizer(managedObjectContext: coreDataStack.managedObjectContext).sync { result in
//            if let result = result {
//                self.trips = result
//                self.tableView.reloadData()
//            } else {
//                print("No Trips could be retrieved")
//            }
//            
//        }
        trips = CoreDataClient(managedObjectContext: coreDataStack.managedObjectContext).allTrips()
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("trips")
        
        cell?.textLabel = trips[indexPath.row].name
        
        return cell
    }
}