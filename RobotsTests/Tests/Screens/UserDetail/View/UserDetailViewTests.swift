//
//  UserDetailViewTests.swift
//  Robots
//
//  Created by Ivan Smetanin on 27/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
@testable import Robots

final class UserDetailViewTests: XCTestCase {

    // MARK: - Properties

    private var view: UserDetailViewController?
    private var output: UserDetailViewOutputMock?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        view = UserDetailViewController()
        output = UserDetailViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    // MARK: - Main tests

    func testThatViewNotifiesPresenterOnDidLoad() {
        // when
        self.view?.viewDidLoad()
        // then
        XCTAssert(self.output?.viewLoadedWasCalled == true)
    }

    // MARK: - Mocks

    final class UserDetailViewOutputMock: UserDetailViewOutput {
        var viewLoadedWasCalled: Bool = false

        func viewLoaded() {
            viewLoadedWasCalled = true
        }
    }

}
