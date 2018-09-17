//
//  UsersService.swift
//  Robots
//
//  Created by Ivan Smetanin on 09/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

final class UsersService: UsersAbstractService {

    // MARK: - Constants

    private let transport: Transport
    private let mapper: UsersAbstractMapper

    // MARK: - Initialization and deinitialization

    init(transport: Transport, mapper: UsersAbstractMapper) {
        self.transport = transport
        self.mapper = mapper
    }

    // MARK: - UsersAbstractService

    func getAll(onCompleted: @escaping ([User]) -> Void, onError: @escaping (Error) -> Void) {
        guard let request = try? UsersServiceRequests.getAll.asURLRequest() else {
            fatalError()
        }

        transport.perform(request: request, onCompleted: { [weak self] _, data in
            guard let `self` = self else {
                return
            }
            do {
                let users = try self.mapper.mapAll(data: data)
                DispatchQueue.main.async {
                    onCompleted(users)
                }
            } catch {
                DispatchQueue.main.async {
                    onError(error)
                }
            }
        }, onError: { error in
            DispatchQueue.main.async {
                onError(error)
            }
        })
    }

}
