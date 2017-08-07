//
//  TimeSavedCalculator.swift
//  Smover
//
//  Created by Laurie Gray on 07/08/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit
import CoreData

final class TimeSavedCalculator {
    let minutesLostPerUsage = 11
    var currentlySavedTimeInMinutes: Int32?
    
    func getTimeSaved(fromSuppliedMinutes minutes:Int32) -> String {
        // Min 11 - Max 42,048,000 
        switch minutes {
        case let lessThan60 where lessThan60 < 60:
            return "\(lessThan60) minutes"
        case let hours where hours > 60 && hours < 60 * 24:
            return "\(hours / 60) hours"
        case let days where days > 60 * 24 && days < (60 * 24) * 7:
            return "\(days / (60 * 24)) days"
        case let weeks where weeks > (60 * 24) * 7 && weeks < ((60 * 24) * 7) * 52:
            return "\(weeks / (60 * 24) * 7) weeks"
        case let years where years > ((60 * 24) * 7) * 52:
            return "\(years / ((60 * 24) * 52)) years"
        default:
            return "No time saved :("
        }
    }
    
     func printTimeSaved() -> String {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return "No Time :(" }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let user = try context.fetch(fetchRequest) as? [User]
            if let fetchedUser = user?[0] {
                currentlySavedTimeInMinutes = fetchedUser.lifeSavedInTimeInMinutes ?? 0
                if let currentlySavedTimeInMinutes = currentlySavedTimeInMinutes {
                    let timeConvertedToFormat = getTimeSaved(fromSuppliedMinutes: currentlySavedTimeInMinutes)
                    return timeConvertedToFormat
                }
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
        return "No Time :("
    }
    
    func adjustTimeSaved(_ didSmoke:Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let user = try context.fetch(fetchRequest) as [User]
            let currentUser = user[0]
            let currentlySavedTime = currentUser.lifeSavedInTimeInMinutes
            
            if didSmoke {
                if currentlySavedTime <= 11 {
                    currentUser.setValue(0, forKey: "lifeSavedInTimeInMinutes")
                } else {
                currentUser.setValue(currentUser.lifeSavedInTimeInMinutes - 11, forKey: "lifeSavedInTimeInMinutes")
                }
            } else {
                currentUser.setValue(currentUser.lifeSavedInTimeInMinutes + 11, forKey: "lifeSavedInTimeInMinutes")
            }
            print("Life Saved is \(currentUser.lifeSavedInTimeInMinutes)")
            try context.save()
            
        } catch let error {
            print(error.localizedDescription)
        }
    
    }
}
