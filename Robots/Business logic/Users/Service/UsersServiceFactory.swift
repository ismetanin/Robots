//
//  UsersServiceFactory.swift
//  Robots
//
//  Created by Ivan Smetanin on 09/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

final class UsersServiceFactory: Factory {

    typealias Output = UsersService

    func produce() -> UsersService {
        return UsersService(transport: URLSessionTransport(), mapper: UsersMapper(), store: UsersInMemoryStore())
    }

}
