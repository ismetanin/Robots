//
//  UserListViewAdapter.swift
//  Robots
//
//  Created by Ivan Smetanin on 03/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit

protocol UserListViewAdapter: CollectionViewAdapter {
    var didSelectUser: ((User) -> Void)? { get set }

    func configure(with items: [User])
}
