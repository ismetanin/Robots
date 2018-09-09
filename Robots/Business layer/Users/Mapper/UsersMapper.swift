//
//  UsersMapper.swift
//  Robots
//
//  Created by Ivan Smetanin on 09/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

final class UsersMapper: UsersAbstractMapper {

    // MARK: - Nested types

    private struct GetAllUsersRawResponse: Codable {
        let items: [User]
    }

    // MARK: - UsersAbstractService

    func mapAll(data: Data) throws -> [User] {
        let decoder = JSONDecoder()
        let serverResponse = try decoder.decode(GetAllUsersRawResponse.self, from: data)
        return serverResponse.items
    }

}
