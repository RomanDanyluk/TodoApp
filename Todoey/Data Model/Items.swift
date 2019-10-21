//
//  Items.swift
//  Todoey
//
//  Created by Romaha  on 10/18/19.
//  Copyright © 2019 Romaha . All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
   @objc dynamic var title: String = ""
   @objc dynamic var done: Bool = false
    @objc dynamic var dateCreate: Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
