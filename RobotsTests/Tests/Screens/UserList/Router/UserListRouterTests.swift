//
//  UserListRouterTests.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
@testable import Robots

final class UserListRouterTests: XCTestCase {

    // MARK: - Properties

    private var view: MockModuleTransitionable?
    private var router: UserListRouter?

	// MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        router = UserListRouter()
        view = MockModuleTransitionable()
        router?.view = view
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        router = nil
    }

    // MARK: - Main test

    func testThatShowUserDetailModulePushesNewModule() {
        // given
        let user = User.mock(withId: 9)
        // when
        router?.showUserDetailModule(with: user)
        // then
        XCTAssert(view?.pushWasCalled == true)
    }

    // MARK: - Mocks

    private final class MockModuleTransitionable: ModuleTransitionable {

        var pushWasCalled: Bool = false

        func showModule(_ module: UIViewController) {}

        func dismissView(animated: Bool, completion: (() -> Void)?) {}

        func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?) {}

        func pop(animated: Bool) {}

        func push(module: UIViewController, animated: Bool) {
            pushWasCalled = true
        }

        func push(module: UIViewController, animated: Bool, hideTabBar: Bool) {}

    }

}
