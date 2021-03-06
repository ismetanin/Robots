//
//  URLRequestConvertible.swift
//  Robots
//
//  Created by Ivan Smetanin on 09/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {
    var stringUrl: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }

    func asURLRequest() throws -> URLRequest
}

extension URLRequestConvertible {

    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: stringUrl) else {
            throw RuntimeError("Can't map url string to URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        if let parameters = parameters {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        }
        return request
    }

}
