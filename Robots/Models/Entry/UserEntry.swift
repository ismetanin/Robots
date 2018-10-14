//
//  UserEntry.swift
//  Robots
//
//  Created by Ivan Smetanin on 14/10/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import RealmSwift

final class UserEntry: Object {

    // MARK: - Properties

    @objc dynamic var id: Int = 0
    @objc dynamic var firstname: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var photoStringURL: String = ""
    @objc dynamic var about: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var company: String = ""
    @objc dynamic var address: String = ""

    // MARK: - Initialization and deinitialization

    convenience init(from user: User) {
        self.init()
        self.id = user.id
        self.firstname = user.firstname
        self.lastname = user.lastname
        self.photoStringURL = user.photoStringURL
        self.about = user.about
        self.phone = user.phone
        self.email = user.email
        self.company = user.company
        self.address = user.address
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    // MARK: - Internal methods

    func toEntity() -> User {
        return User(
            id: id, firstname: firstname, lastname: lastname,
            photoStringURL: photoStringURL, about: about, phone: phone,
            email: email, company: company, address: address
        )
    }

}
