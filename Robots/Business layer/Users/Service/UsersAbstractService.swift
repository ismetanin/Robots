//
//  UsersAbstractService.swift
//  Robots
//
//  Created by Ivan Smetanin on 09/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

protocol UsersAbstractService {
    func getAll(onCompleted: @escaping ([User]) -> Void, onError: @escaping (Error) -> Void)
}
