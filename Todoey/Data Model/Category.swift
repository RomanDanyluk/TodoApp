//
//  Categories.swift
//  Todoey
//
//  Created by Romaha  on 10/18/19.
//  Copyright © 2019 Romaha . All rights reserved.
//

import Foundation
import RealmSwift

class  Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
