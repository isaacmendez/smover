//
//  ColdTurkeyModeIsActive.swift
//  Smover
//
//  Created by Laurie Gray on 28/07/2017.
//

import UIKit
import CoreData

class OptionsLoader:NSObject {

static func isColdTurkeyActive() -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        let context = appDelegate.persistentContainer.viewContext
    
        let fetchRequest:NSFetchRequest<AppMode> = AppMode.fetchRequest()
    
        do {
            let results = try context.fetch(fetchRequest)
    
        let appModeResult = results.first! as AppMode
        return appModeResult.isColdTurkeyModeActive
            
        } catch let error {
            print(error)
        }
    return false
    }

    static func setColdTurkeyMode(withValue switchValue:Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
    
    let fetchRequest:NSFetchRequest<AppMode> = AppMode.fetchRequest()
    
    do {
        var result = try context.fetch(fetchRequest) as [AppMode]
        if result.count > 0 {
            let result1 = result[0]
            result1.setValue(switchValue, forKey: "isColdTurkeyModeActive")
            try context.save()
            // Remove the record
            // Add new record with passed in value
        }
    } catch let error {
        print(error.localizedDescription)
    }
    
    }
}
