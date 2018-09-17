//
//  UsersMapperTests.swift
//  RobotsTests
//
//  Created by Ivan Smetanin on 15/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
@testable import Robots

final class UsersMapperTests: XCTestCase {

    func testThatMapperCorrectlyMapsData() {
        // given
        let mapper = UsersMapper()
        guard let data = """
        {
            "items": [
                {
                  "about": "about 1",
                  "address": "address 1",
                  "company": "company 1",
                  "email": "email 1",
                  "first_name": "firstname 1",
                  "id": 1,
                  "last_name": "lastname 1",
                  "phone": "phone 1",
                  "photo": "photo 1"
                },
                {
                  "about": "about 2",
                  "address": "address 2",
                  "company": "company 2",
                  "email": "email 2",
                  "first_name": "firstname 2",
                  "id": 2,
                  "last_name": "lastname 2",
                  "phone": "phone 2",
                  "photo": "photo 2"
                }
            ]
        }
        """.data(using: .utf8) else {
            fatalError("Can't create data")
        }
        let expectedUsers = [
            User(id: 1,
                 firstname: "firstname 1",
                 lastname: "lastname 1",
                 photoStringURL: "photo 1",
                 about: "about 1",
                 phone: "phone 1",
                 email: "email 1",
                 company: "company 1",
                 address: "address 1"
            ),
            User(id: 2,
                 firstname: "firstname 2",
                 lastname: "lastname 2",
                 photoStringURL: "photo 2",
                 about: "about 2",
                 phone: "phone 2",
                 email: "email 2",
                 company: "company 2",
                 address: "address 2"
            )
        ]
        // when
        let mappedUsers: [User]
        do {
            mappedUsers = try mapper.mapAll(data: data)
        } catch {
            mappedUsers = []
            XCTFail()
            print(error)
        }
        // then
        XCTAssert(expectedUsers.count == mappedUsers.count)
        for item in mappedUsers {
            guard let index = expectedUsers.index(where: { $0.id == item.id }) else {
                XCTFail()
                return
            }
            let expectedItem = expectedUsers[index]
            XCTAssert(expectedItem.firstname == item.firstname)
            XCTAssert(expectedItem.lastname == item.lastname)
            XCTAssert(expectedItem.photoStringURL == item.photoStringURL)
            XCTAssert(expectedItem.about == item.about)
            XCTAssert(expectedItem.phone == item.phone)
            XCTAssert(expectedItem.email == item.email)
            XCTAssert(expectedItem.company == item.company)
            XCTAssert(expectedItem.address == item.address)
        }
    }

    func testThatMapperThrowsErrorOnIncorrectData() {
        // given
        let mapper = UsersMapper()
        guard let data = """
        {
            "item": [
                {
                  "about": "about 1",
                  "address": "address 1",
                  "company": "company 1",
                  "email": "email 1",
                  "first_name": "firstname 1",
                  "id": 1,
                  "last_name": "lastname 1",
                  "phone": "phone 1",
                  "photo": "photo 1"
                }
            ]
        }
        """.data(using: .utf8) else {
            fatalError("Can't create data")
        }
        // when
        do {
            _ = try mapper.mapAll(data: data)
            XCTFail()
        } catch {
            XCTAssert(true)
        }

    }

}
