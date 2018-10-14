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
