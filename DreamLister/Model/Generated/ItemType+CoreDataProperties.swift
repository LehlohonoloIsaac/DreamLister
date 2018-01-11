//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by dvt on 2018/01/11.
//  Copyright © 2018 dvt. All rights reserved.
//
//

import Foundation
import CoreData

extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
