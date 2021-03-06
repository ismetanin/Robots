//
//  UserListViewTests.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
@testable import Robots

final class UserListViewTests: XCTestCase {

    // MARK: - Properties

    private var view: UserListViewController?
    private var output: UserListViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = UserListViewController()
        output = UserListViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    func testThatViewAsksForDataOnDidLoad() {
        // when
        self.view?.viewDidLoad()
        // then
        XCTAssert(self.output?.loadDataWasCalled == true)
    }

    func testThatViewAsksForSelectUser() {
        // given
        let user = User(id: 0, firstname: "", lastname: "",
                        photoStringURL: "", about: "", phone: "",
                        email: "", company: "", address: "")
        self.view?.adapter = UserListViewAdapterMock()
        // when
        self.view?.viewDidLoad()
        self.view?.adapter?.didSelectUser?(user)
        // then
        XCTAssert(self.output?.selectUserWasCalled == true)
    }

    // MARK: - Mocks

    private final class UserListViewOutputMock: UserListViewOutput {

        var loadDataWasCalled = false
        var selectUserWasCalled = false

        func loadData() {
            loadDataWasCalled = true
        }

        func select(user: User) {
            selectUserWasCalled = true
        }

    }

    private final class UserListViewAdapterMock: UserListViewAdapter {

        var didSelectUser: ((User) -> Void)?

        func configure(with items: [User]) {
        }

        func set(view: CollectionDisplayable) {
        }

    }

}
