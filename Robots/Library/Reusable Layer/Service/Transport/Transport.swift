//
//  Transport.swift
//  Robots
//
//  Created by Ivan Smetanin on 09/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

protocol Transport {
    func perform(request: URLRequest, onCompleted: @escaping (URLResponse, Data) -> Void, onError: @escaping (Error) -> Void)
}
