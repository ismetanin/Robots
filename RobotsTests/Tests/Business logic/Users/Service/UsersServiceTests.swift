//
//  UsersServiceTests.swift
//  RobotsTests
//
//  Created by Ivan Smetanin on 16/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import XCTest
@testable import Robots

final class UsersServiceTests: XCTestCase {

    // MARK: - Main tests

    func testThatGetAllHandlesTransportError() {
        // given
        let expectedError: NSError = NSError(domain: "mydom", code: 129, userInfo: ["in": "fo"])
        let service = UsersService(
            transport: MockTransport(policy: .returnError(error: expectedError)),
            mapper: UsersMapper(),
            store: MockStore(policy: .returnData(data: nil))
        )
        // when
        service.getAll(onCompleted: { _ in
            // then
            XCTFail()
        }, onError: { error in
            XCTAssert(expectedError == error as NSError)
        })
    }

    func testThatGetAllHandlesData() {
        // given
        let expectedUsers = [
            User(id: 1,
                 firstname: "firstname 1",
                 lastname: "lastname 1",
                 photoStringURL: "photo 1",
                 about: "about 1",
                 phone: "phone 1",
                 email: "email 1",
                 company: "company 1",
                 address: "address 1"
            ),
            User(id: 2,
                 firstname: "firstname 2",
                 lastname: "lastname 2",
                 photoStringURL: "photo 2",
                 about: "about 2",
                 phone: "phone 2",
                 email: "email 2",
                 company: "company 2",
                 address: "address 2"
            )
        ]
        let service = UsersService(
            transport: MockTransport(policy: .returnData(response: URLResponse(), data: Data())),
            mapper: MockMapper(policy: .returnData(data: expectedUsers)),
            store: MockStore(policy: .returnData(data: nil))
        )
        // when
        service.getAll(onCompleted: { users in
            // then
            XCTAssert(expectedUsers.count == users.count)
            for item in users {
                guard let index = expectedUsers.index(where: { $0.id == item.id }) else {
                    XCTFail()
                    return
                }
                let expectedItem = expectedUsers[index]
                XCTAssert(expectedItem.firstname == item.firstname)
                XCTAssert(expectedItem.lastname == item.lastname)
                XCTAssert(expectedItem.photoStringURL == item.photoStringURL)
                XCTAssert(expectedItem.about == item.about)
                XCTAssert(expectedItem.phone == item.phone)
                XCTAssert(expectedItem.email == item.email)
                XCTAssert(expectedItem.company == item.company)
                XCTAssert(expectedItem.address == item.address)
            }
        }, onError: { error in
            XCTFail()
        })
    }

    func testThatGetAllHandlesMappingError() {
        // given
        let service = UsersService(
            transport: MockTransport(policy: .returnData(response: URLResponse(), data: Data())),
            mapper: UsersMapper(),
            store: MockStore(policy: .returnData(data: nil))
        )
        // when
        service.getAll(onCompleted: { _ in
            // then
            XCTFail()
        }, onError: { error in
            XCTAssert(true)
        })
    }

    // MARK: - Mocks

    private final class MockTransport: Transport {

        enum ResponsePolicy {
            case returnError(error: NSError)
            case returnData(response: URLResponse, data: Data)
        }

        let policy: ResponsePolicy

        init(policy: ResponsePolicy) {
            self.policy = policy
        }

        func perform(request: URLRequest, onCompleted: @escaping (URLResponse, Data) -> Void, onError: @escaping (Error) -> Void) {
            switch policy {
            case .returnData(let response, let data):
                onCompleted(response, data)
            case .returnError(let error):
                onError(error)
            }
        }

    }

    private final class MockMapper: UsersAbstractMapper {

        enum ResponsePolicy {
            case returnError(error: NSError)
            case returnData(data: [User])
        }

        let policy: ResponsePolicy

        init(policy: ResponsePolicy) {
            self.policy = policy
        }

        func mapAll(data: Data) throws -> [User] {
            switch policy {
            case .returnData(let data):
                return data
            case .returnError(let error):
                throw error
            }
        }

    }

    private final class MockStore: UsersAbstractStore {

        enum ResponsePolicy {
            case returnData(data: [User]?)
        }

        let policy: ResponsePolicy

        init(policy: ResponsePolicy) {
            self.policy = policy
        }

        func getAll() -> [User]? {
            switch policy {
            case .returnData(let data):
                return data
            }
        }

        func append(_ model: User) {

        }

        func append(_ models: [User]) {

        }

        func remove(_ model: User) {

        }

        func removeAll() {

        }

    }

}
