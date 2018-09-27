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

    func testThatViewControllerLoadsCorrectly() {
        if UIStoryboard(name: String(describing: UserDetailViewController.self),
                        bundle: Bundle.main).instantiateInitialViewController() == nil {
            XCTFail("Can't load UserDetailViewController from storyboard, check that controller is initial view controller")
        }
    }

    func testThatScreenConfiguresCorrectly() {
        // when
        let viewController = UserDetailModuleConfigurator().configure()

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
