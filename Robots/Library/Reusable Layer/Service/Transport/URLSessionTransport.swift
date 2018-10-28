//
//  URLSessionTransport.swift
//  Robots
//
//  Created by Ivan Smetanin on 09/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

final class URLSessionTransport: Transport {

    func perform(request: URLRequest, onCompleted: @escaping (URLResponse, Data) -> Void, onError: @escaping (Error) -> Void) {
        _ = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                onError(error)
                return
            }

            guard let data = data, let response = response else {
                onError(BaseServerError.undefind)
                return
            }

            onCompleted(response, data)
        }).resume()
    }

}
