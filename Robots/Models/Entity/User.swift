//
//  User.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

struct User: Codable {

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

    let id: Int
    let firstname: String
    let lastname: String
    let photoStringURL: String
    let about: String
    let phone: String
    let email: String
    let company: String
    let address: String

    init(id: Int, firstname: String, lastname: String,
         photoStringURL: String, about: String, phone: String,
         email: String, company: String, address: String) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.photoStringURL = photoStringURL
        self.about = about
        self.phone = phone
        self.email = email
        self.company = company
        self.address = address
    }

}

extension User: Equatable {

    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }

}
