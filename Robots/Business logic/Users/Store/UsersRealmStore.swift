//
//  UsersRealmStore.swift
//  Robots
//
//  Created by Ivan Smetanin on 14/10/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import RealmSwift

final class UsersRealmStore: UsersAbstractStore {

    // MARK: - Properties

    private var realm: Realm? {
        return try? Realm()
    }

    // MARK: - UsersAbstractStore

    func getAll() -> [User]? {
        return realm?.objects(UserEntry.self).map { $0.toEntity() }
    }

    func append(_ model: User) {
        let entry = UserEntry(from: model)
        let realm = self.realm
        try? realm?.write {
            realm?.add(entry)
        }
    }

    func append(_ models: [User]) {
        let entries = models.map { UserEntry(from: $0) }
        let realm = self.realm
        try? realm?.write {
            realm?.add(entries)
        }
    }

    func remove(_ model: User) {
        guard let entry = user(byId: model.id) else {
            return
        }
        let realm = self.realm
        try? realm?.write {
            realm?.delete(entry)
        }
    }

    func removeAll() {
        let realm = self.realm
        try? realm?.write {
            realm?.deleteAll()
        }
    }

    // MARK: - Private methods

    private func user(byId id: Int) -> UserEntry? {
        return realm?.object(ofType: UserEntry.self, forPrimaryKey: id)
    }

}
