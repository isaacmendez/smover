//
//  User+CoreDataProperties.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var age: Int32
    @NSManaged public var bmi: Double
    @NSManaged public var height: Double
    @NSManaged public var lifeSavedInTimeInSeconds: Double
    @NSManaged public var userName: String?
    @NSManaged public var weight: Double

}
