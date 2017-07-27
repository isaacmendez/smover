//
//  DiaryEntry+CoreDataProperties.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension DiaryEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiaryEntry> {
        return NSFetchRequest<DiaryEntry>(entityName: "DiaryEntry");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var title: String?
    @NSManaged public var entryBody: String?

}
