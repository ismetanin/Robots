//
//  User.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let firstname: String
    let lastname: String
    let photoStringURL: String
    let about: String
    let phone: String
    let email: String
    let company: String
    let address: String

    private enum CodingKeys: String, CodingKey {
        case firstname = "first_name"
        case lastname = "last_name"
        case photoStringURL = "photo"

        case id
        case about
        case address
        case email
        case company
        case phone
    }
}
