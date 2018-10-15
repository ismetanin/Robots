//
//  UserEntryTests.swift
//  RobotsTests
//
//  Created by Ivan Smetanin on 15/10/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
@testable import Robots

final class UserEntryTests: XCTestCase {

    func testThatToEntityCorrectlyMapsUserEntryToUser() {
        // given
        let entry = UserEntry()
        entry.about = "about"
        entry.address = "address"
        entry.company = "company"
        entry.email = "email"
        entry.firstname = "firstname"
        entry.id = 9999
        entry.lastname = "lastname"
        entry.phone = "phone"
        entry.photoStringURL = "photoStringURL"
        // when
        let entity = entry.toEntity()
        // then
        XCTAssert(entity.about == "about")
        XCTAssert(entity.address == "address")
        XCTAssert(entity.company == "company")
        XCTAssert(entity.email == "email")
        XCTAssert(entity.firstname == "firstname")
        XCTAssert(entity.id == 9999)
        XCTAssert(entity.lastname == "lastname")
        XCTAssert(entity.phone == "phone")
        XCTAssert(entity.photoStringURL == "photoStringURL")
    }

    func testThatEntryDoesntLoseFieldsWhenInitializesWithUser() {
        // given
        let user = User(
            id: 9999,
            firstname: "firstname",
            lastname: "lastname",
            photoStringURL: "photoStringURL",
            about: "about",
            phone: "phone",
            email: "email",
            company: "company",
            address: "address"
        )
        // when
        let entry = UserEntry(from: user)
        // then
        XCTAssert(entry.about == "about")
        XCTAssert(entry.address == "address")
        XCTAssert(entry.company == "company")
        XCTAssert(entry.email == "email")
        XCTAssert(entry.firstname == "firstname")
        XCTAssert(entry.id == 9999)
        XCTAssert(entry.lastname == "lastname")
        XCTAssert(entry.phone == "phone")
        XCTAssert(entry.photoStringURL == "photoStringURL")
    }

    func testThatUserAndUserEntryConvertedToUserIsEqual() {
        // given
        let user = User(
            id: 9999,
            firstname: "firstname",
            lastname: "lastname",
            photoStringURL: "photoStringURL",
            about: "about",
            phone: "phone",
            email: "email",
            company: "company",
            address: "address"
        )
        let userEntry = UserEntry(from: user)
        // when
        let userEntityFromUserEntry = userEntry.toEntity()
        // then
        XCTAssert(user == userEntityFromUserEntry)
    }

}
