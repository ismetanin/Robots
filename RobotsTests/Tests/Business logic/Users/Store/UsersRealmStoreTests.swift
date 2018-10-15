//
//  UsersRealmStoreTests.swift
//  RobotsTests
//
//  Created by Ivan Smetanin on 15/10/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
import RealmSwift
@testable import Robots

final class UsersRealmStoreTests: XCTestCase {

    // MARK: - Properties

    private var store: UsersRealmStore?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        // Create store
        self.store = UsersRealmStore()
        // Clean up store
        self.store?.removeAll()
    }

    override func tearDown() {
        super.tearDown()
        self.store = nil
    }

    // MARK: - Main tests

    func testThatGetAllReturnsAllEntities() {
        // given
        let user1 = User.mock(withId: 1)
        let user2 = User.mock(withId: 2)
        let users = [user1, user2]
        // when
        store?.append(users)
        // then
        guard let usersFromStore = store?.getAll() else {
            XCTFail("usersFromStore is nil")
            return
        }
        XCTAssert(usersFromStore.count == users.count)
    }

    func testThatAppendAddsUserToStore() {
        // given
        let user = User.mock(withId: 1)
        // when
        store?.append(user)
        // then
        guard let usersFromStore = store?.getAll() else {
            XCTFail("usersFromStore is nil")
            return
        }
        XCTAssert(usersFromStore.count == 1)
        XCTAssert(usersFromStore.contains(user))
    }

    func testThatAppendAddsUsersToStore() {
        // given
        let user1 = User.mock(withId: 1)
        let user2 = User.mock(withId: 2)
        let users = [user1, user2]
        // when
        store?.append(users)
        // then
        guard let usersFromStore = store?.getAll() else {
            XCTFail("usersFromStore is nil")
            return
        }
        XCTAssert(usersFromStore.count == users.count)
        for user in users {
            XCTAssert(usersFromStore.contains(user))
        }
    }

    func testThatRemoveRemovesUserFromStore() {
        // given
        let user1 = User.mock(withId: 1)
        let user2 = User.mock(withId: 2)
        let users = [user1, user2]
        store?.append(users)
        // when
        store?.remove(user2)
        // then
        guard let usersFromStore = store?.getAll() else {
            XCTFail("usersFromStore is nil")
            return
        }
        XCTAssert(usersFromStore.count == users.count - 1)
        XCTAssert(usersFromStore.contains(user1))
        XCTAssert(!usersFromStore.contains(user2))
    }

    func testThatRemoveAllRemovesAllUsersFromStore() {
        // given
        let user1 = User.mock(withId: 1)
        let user2 = User.mock(withId: 2)
        let users = [user1, user2]
        store?.append(users)
        // when
        store?.removeAll()
        // then
        guard let usersFromStore = store?.getAll() else {
            XCTFail("usersFromStore is nil")
            return
        }
        XCTAssert(usersFromStore.isEmpty)
    }

}
