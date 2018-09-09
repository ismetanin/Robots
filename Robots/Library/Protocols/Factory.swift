//
//  Factory.swift
//  Robots
//
//  Created by Ivan Smetanin on 09/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

protocol Factory {

    associatedtype Output

    func produce() -> Output

}
