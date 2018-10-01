//
//  Global.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/10/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Foundation

func onMain(_ closure: @escaping () -> Void) {
    if Thread.isMainThread {
        closure()
    } else {
        DispatchQueue.main.async {
            closure()
        }
    }
}
