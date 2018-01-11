//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by dvt on 2018/01/11.
//  Copyright © 2018 dvt. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
}
