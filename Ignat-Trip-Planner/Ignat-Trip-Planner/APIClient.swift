//
//  APIClient.swift
//  Ignat-Trip-Planner
//
//  Created by Ignat Remizov on 10/30/15.
//  Copyright © 2015 Ignat Remizov. All rights reserved.
//

import Foundation


typealias FetchTripsCallback = ([JSONTrip]?) -> Void


class APIClient {
    func fetchTrips(completion: FetchTripsCallback) {
        let session = NSURLSession.sharedSession()
        
        let url = NSURL(string: "")!
        let urlRequest = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(urlRequest) { data, response, error in
            if let data = data {
                print(data)
                let jsonArray = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) as! [Dictionary<String, AnyObject>]
                let trips = JSONTrip.modelsFromJSONArray(jsonArray)
                if let trips = trips {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(trips)
                    }
                } else {
                    print("Trips could not be parsed. :(")
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(nil)
                    }
                }
            }
        }
        
        task.resume()
        
    }
}