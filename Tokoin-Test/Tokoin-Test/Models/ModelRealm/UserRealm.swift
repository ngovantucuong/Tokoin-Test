//
//  UserRealm.swift
//  Tokoin-Test
//
//  Created by ngovantucuong on 9/13/20.
//  Copyright © 2020 ngovantucuong. All rights reserved.
//

import RealmSwift

class UserRealm: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var phone: String = ""
    convenience init(name: String,
                     address: String,
                     phone: String) {
        self.init()
        self.id = UUID().uuidString
        self.name = name
        self.address = address
        self.phone = phone
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
