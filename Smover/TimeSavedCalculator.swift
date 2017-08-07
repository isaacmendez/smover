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
    
    func getTimeSaved(fromSuppliedMinutes minutes:Int32) -> Int32 {
        // Min 11 - Max 42,048,000 
        switch minutes {
        case let lessThan60 where lessThan60 < 60:
            return lessThan60
        case let hours where hours > 60 && hours < 60 * 24:
            return hours / 60
        case let days where days > 60 * 24 && days < (60 * 24) * 7:
            return days / (60 * 24)
        case let weeks where weeks > (60 * 24) * 7 && weeks < ((60 * 24) * 7) * 52:
            return weeks / (60 * 24) * 7
        case let years where years > ((60 * 24) * 7) * 52:
            return years / ((60 * 24) * 52)
        default:
            return 0
        }
    }
    
     func printTimeSaved() -> String {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return "No Time :(" }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let user = try context.fetch(fetchRequest)
            if let fetchedUser = user[0] as? User  {
                currentlySavedTimeInMinutes = fetchedUser.lifeSavedInTimeInMinutes ?? 0
                if let currentlySavedTimeInMinutes = currentlySavedTimeInMinutes {
                    let timeConvertedToFormat = getTimeSaved(fromSuppliedMinutes: currentlySavedTimeInMinutes)
                    return String(timeConvertedToFormat)
                }
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
        return "No Time :("
    }
}
