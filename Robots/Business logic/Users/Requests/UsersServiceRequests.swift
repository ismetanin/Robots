//
//  UsersServiceRequests.swift
//  Robots
//
//  Created by Ivan Smetanin on 09/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

enum UsersServiceRequests: URLRequestConvertible {

    case getAll

    var stringUrl: String {
        switch self {
        case .getAll:
            return "https://agency5-mobile-school.firebaseio.com/data.json"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getAll:
            return .get
        }
    }

    var headers: [String: String]? {
        switch self {
        case .getAll:
            return nil
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .getAll:
            return nil
        }
    }

}
