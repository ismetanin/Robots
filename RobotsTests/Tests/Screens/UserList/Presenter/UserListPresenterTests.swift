//
//  UserListPresenterTests.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
@testable import Robots

final class UserListPresenterTest: XCTestCase {

    // MARK: - Properties

    private var presenter: UserListPresenter?
    private var view: MockViewController?
    private var output: MockModuleOutput?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        presenter = UserListPresenter()
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

    func testThatPresenterLoadsData() {

    }

    // MARK: - Mocks

    private final class MockRouter: UserListRouterInput {

    }

    private final class MockViewController: UserListViewInput {

        func configure(with: UserListViewState) {

        }

    }

    private final class MockModuleOutput: UserListModuleOutput {

    }

}
