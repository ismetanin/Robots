//
//  UserListViewState.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

enum UserListViewState {
    case data(users: [User])
    case loading
    case error(error: Error)
}
