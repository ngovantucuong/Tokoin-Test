//
//  DBManager.swift
//  Tokoin-Test
//
//  Created by ngovantucuong on 9/13/20.
//  Copyright © 2020 ngovantucuong. All rights reserved.
//

import Foundation
import  RealmSwift

typealias USER_REALM_DATA = (_ data: [UserRealm]) -> Void

class DBManager {
    // MARK: - Properties
    private var realm: Realm!
    static let shared = DBManager()
    
    static var config: Realm.Configuration {
        var config = Realm.Configuration.defaultConfiguration
        // Use the default directory, but replace the filename with the username
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("TOKOIN")
        return config
    }
    
    // MARK: - Init
    private init() {
        do {
            realm = try Realm(configuration: type(of: self).config)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Func
    func getDataUser(complete: @escaping USER_REALM_DATA) {
        complete(Array(realm.objects(UserRealm.self)))
    }
    
    func addUser(with object: UserRealm, complete: @escaping (_ isSuccess: Bool) -> Void) {
        do {
            try realm.write {
                realm.add(object, update: Realm.UpdatePolicy.all)
                complete(true)
            }
        } catch {
            complete(false)
            print(error.localizedDescription)
        }
    }
}
