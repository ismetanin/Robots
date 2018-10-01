//
//  UsersService.swift
//  Robots
//
//  Created by Ivan Smetanin on 09/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

final class UsersService: UsersAbstractService {

    // MARK: - Nested types

    private enum Constants {
        static let getAllReturnPolicy: ServicePolicy = .firstCacheThenRefreshFromServer
    }

    // MARK: - Constants

    private let transport: Transport
    private let mapper: UsersAbstractMapper
    private let store: UsersAbstractStore

    // MARK: - Initialization and deinitialization

    init(transport: Transport, mapper: UsersAbstractMapper, store: UsersAbstractStore) {
        self.transport = transport
        self.mapper = mapper
        self.store = store
    }

    // MARK: - UsersAbstractService

    func getAll(onCompleted: @escaping ([User]) -> Void, onError: @escaping (Error) -> Void) {
        switch Constants.getAllReturnPolicy {
        case .networkOnly:
            loadAllUsersFromService(onCompleted: onCompleted, onError: onError)
        case .cacheOnly:
            loadAllUsersFromCache(onCompleted: onCompleted, onError: onError)
        case .firstCacheThenRefreshFromServer:
            loadAllUsersFromCache(onCompleted: onCompleted, onError: onError) { [weak self] in
                self?.loadAllUsersFromService(onCompleted: onCompleted, onError: onError)
            }
        case .firstServerThenRefreshFromCache:
            loadAllUsersFromService(onCompleted: onCompleted, onError: onError) { [weak self] in
                self?.loadAllUsersFromCache(onCompleted: onCompleted, onError: onError)
            }
        }
    }

    // MARK: - Private methods

    private func loadAllUsersFromService(onCompleted: @escaping ([User]) -> Void,
                                         onError: @escaping (Error) -> Void,
                                         completion: EmptyClosure? = nil) {
        guard let request = try? UsersServiceRequests.getAll.asURLRequest() else {
            fatalError()
        }

        transport.perform(request: request, onCompleted: { [weak self] _, data in
            defer {
                completion?()
            }
            guard let `self` = self else {
                return
            }

            do {
                let users = try self.mapper.mapAll(data: data)
                onCompleted(users)
            } catch {
                onError(error)
            }
        }, onError: { error in
            onError(error)
            completion?()
        })
    }

    private func loadAllUsersFromCache(onCompleted: @escaping ([User]) -> Void,
                                       onError: @escaping (Error) -> Void,
                                       completion: EmptyClosure? = nil) {
        if let users = store.getAll() {
            onCompleted(users)
        }
        completion?()
    }

}
