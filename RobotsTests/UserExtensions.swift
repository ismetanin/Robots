//
//  UserExtensions.swift
//  RobotsTests
//
//  Created by Ivan Smetanin on 15/10/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
@testable import Robots

extension User {

    /// Creates an user with a given id, adds this id to each field.
    ///
    /// - Parameter id: id that should be used for mocking.
    static func mock(withId id: Int) -> User {
        let user = User(
            id: id,
            firstname: "\(id)",
            lastname: "\(id)",
            photoStringURL: "\(id)",
            about: "\(id)",
            phone: "\(id)",
            email: "\(id)",
            company: "\(id)",
            address: "\(id)"
        )
        return user
    }

}
