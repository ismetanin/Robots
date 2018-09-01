//
//  UserListModuleConfiguratorTests.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
@testable import Robots

final class UserListModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = UserListModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "UserListViewController is nil after configuration")
        XCTAssertTrue(viewController.output is UserListPresenter, "output is not UserListPresenter")

        guard let presenter: UserListPresenter = viewController.output as? UserListPresenter else {
            XCTFail("Cannot assign viewController.output as UserListPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in UserListPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in UserListPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is UserListRouter, "router is not UserListRouter")

        guard let router: UserListRouter = presenter.router as? UserListRouter else {
            XCTFail("Cannot assign presenter.router as UserListRouter")
            return
        }

        XCTAssertTrue(router.view is UserListViewController, "view in router is not UserListViewController")
    }

}
