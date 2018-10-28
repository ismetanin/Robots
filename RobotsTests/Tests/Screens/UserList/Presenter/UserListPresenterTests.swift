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

    func testThatPresenterShowsLoadingState() {
        // given
        let service = MockUsersService()
        service.responsePolicy = .noReturn
        presenter?.service = service
        let expectation = self.expectation(description: "Configure calling")
        view?.configureExpectation = expectation
        // when
        presenter?.loadData()
        waitForExpectations(timeout: 0, handler: nil)
        // then
        guard let state = view?.lastReceivedState else {
            XCTFail()
            return
        }
        if case UserListViewState.loading = state {
            XCTAssert(true)
        } else {
            XCTFail()
        }
    }

    func testThatPresenterPassesDataToView() {
        // given
        let service = MockUsersService()
        let expectedUsers = [User(
            id: 1,
            firstname: "firstname 1",
            lastname: "lastname 1",
            photoStringURL: "photo 1",
            about: "about 1",
            phone: "phone 1",
            email: "email 1",
            company: "company 1",
            address: "address 1"
        )]
        service.responsePolicy = .returnData(data: expectedUsers)
        presenter?.service = service
        let expectation = self.expectation(description: "Configure calling")
        expectation.expectedFulfillmentCount = 2 // loading -> data
        view?.configureExpectation = expectation
        // when
        presenter?.loadData()
        waitForExpectations(timeout: 1, handler: nil)
        // then
        guard let state = view?.lastReceivedState else {
            XCTFail()
            return
        }
        switch state {
        case .data(let users):
            XCTAssert(expectedUsers.count == users.count)
        case .error(_):
            XCTFail()
        case .loading:
            XCTFail()
        }
    }

    func testThatPresenterPassesErrorToView() {
        // given
        let service = MockUsersService()
        let expectedError = NSError(domain: "domain", code: 1240, userInfo: ["fo": "in"])
        service.responsePolicy = .returnError(error: expectedError)
        presenter?.service = service
        let expectation = self.expectation(description: "Configure calling")
        expectation.expectedFulfillmentCount = 2 // loading -> error
        view?.configureExpectation = expectation
        // when
        presenter?.loadData()
        waitForExpectations(timeout: 1, handler: nil)
        // then
        guard let state = view?.lastReceivedState else {
            XCTFail()
            return
        }
        switch state {
        case .data(_):
            XCTFail()
        case .error(let error):
            XCTAssert(error as NSError == expectedError)
        case .loading:
            XCTFail()
        }
    }

    // MARK: - Mocks

    private final class MockRouter: UserListRouterInput {

        func showUserDetailModule(with user: User) {

        }

    }

    private final class MockViewController: UserListViewInput {

        var configureExpectation: XCTestExpectation?
        var lastReceivedState: UserListViewState? = nil

        func configure(with state: UserListViewState) {
            guard let expectation = configureExpectation else {
                XCTFail("MockViewController was not setup correctly. Missing XCTExpectation reference")
                return
            }
            lastReceivedState = state
            expectation.fulfill()
        }

    }

    private final class MockModuleOutput: UserListModuleOutput {

    }

    private final class MockUsersService: UsersAbstractService {

        enum ResponsePolicy {
            case returnError(error: Error)
            case returnData(data: [User])
            case noReturn
        }

        var responsePolicy: ResponsePolicy = .returnError(error: NSError(domain: "domain", code: 1, userInfo: nil))
        var currentCurrencyCode: String = ""
        var getUsersCallsCount: Int = 0

        func getAll(policy: ServicePolicy, onCompleted: @escaping ([User]) -> Void, onError: @escaping (Error) -> Void) {
            getUsersCallsCount += 1
            switch responsePolicy {
            case .returnData(let data):
                onCompleted(data)
            case .returnError(let error):
                onError(error)
            case .noReturn:
                break
            }
        }

    }

}
