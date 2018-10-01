//
//  UsersAbstractStore.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/10/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

protocol UsersAbstractStore {

    func getAll() -> [User]?

    func append(_ model: User)

    func append(_ models: [User])

    func remove(_ model: User)

    func removeAll()

}

final class UsersInMemoryStore: UsersAbstractStore {

    private var users: [User]?

    func getAll() -> [User]? {
        return users
    }

    func append(_ model: User) {
        if users == nil {
            users = []
        }
        users?.append(model)
    }

    func append(_ models: [User]) {
        if users == nil {
            users = []
        }
        users?.append(contentsOf: models)
    }

    func remove(_ model: User) {
        guard let index = users?.firstIndex(of: model) else {
            return
        }
        users?.remove(at: index)
    }

    func removeAll() {
        users?.removeAll()
    }

}
