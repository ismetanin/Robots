//
//  UserDetailPresenterTests.swift
//  Robots
//
//  Created by Ivan Smetanin on 27/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
@testable import Robots

final class UserDetailPresenterTest: XCTestCase {

    // MARK: - Properties

    private var presenter: UserDetailPresenter?
    private var view: MockViewController?
    private var output: MockModuleOutput?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        presenter = UserDetailPresenter()
        presenter?.router = MockRouter()
        view = MockViewController()
        presenter?.view = view
        output = MockModuleOutput()
        presenter?.output = output
    }

    override func tearDown() {
        super.tearDown()
        presenter = nil
        view = nil
    }

    // MARK: - Main tests

    func testThatPresenterHandlesLoadDataEvent() {

    }

    // MARK: - Mocks

    private final class MockRouter: UserDetailRouterInput {
    }

    private final class MockViewController: UserDetailViewInput {

        var configureWasCalled: Bool = false

        func configure(with state: UserDetailViewState) {

        }

    }

    private final class MockModuleOutput: UserDetailModuleOutput {

    }

}
