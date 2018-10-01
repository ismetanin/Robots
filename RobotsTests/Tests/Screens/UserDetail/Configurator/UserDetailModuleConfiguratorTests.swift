//
//  UserDetailModuleConfiguratorTests.swift
//  Robots
//
//  Created by Ivan Smetanin on 27/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
@testable import Robots

final class UserDetailModuleConfiguratorTests: XCTestCase {

	// MARK: - Main tests

    func testThatScreenConfiguresCorrectly() {
        // given
        let user = User(
            id: 1,
            firstname: "firstname 1",
            lastname: "lastname 1",
            photoStringURL: "photo 1",
            about: "about 1",
            phone: "phone 1",
            email: "email 1",
            company: "company 1",
            address: "address 1"
        )
        // when
        let viewController = UserDetailModuleConfigurator().configure(user: user)

        // then
        XCTAssertNotNil(viewController.output, "UserDetailViewController is nil after configuration")
        XCTAssertTrue(viewController.output is UserDetailPresenter, "output is not UserDetailPresenter")

        guard let presenter: UserDetailPresenter = viewController.output as? UserDetailPresenter else {
            XCTFail("Cannot assign viewController.output as UserDetailPresenter")
            return
        }

        XCTAssertNotNil(presenter.view, "view in UserDetailPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in UserDetailPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is UserDetailRouter, "router is not UserDetailRouter")

        guard let router: UserDetailRouter = presenter.router as? UserDetailRouter else {
            XCTFail("Cannot assign presenter.router as UserDetailRouter")
            return
        }

        XCTAssertTrue(router.view is UserDetailViewController, "view in router is not UserDetailViewController")
    }

}
