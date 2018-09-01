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

    // MARK: - Mocks

    final class UserListViewOutputMock: UserListViewOutput {

        var loadDataWasCalled = false

        func loadData() {
            loadDataWasCalled = true
        }

    }

}
