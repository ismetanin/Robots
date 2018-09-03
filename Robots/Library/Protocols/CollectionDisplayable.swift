//
//  CollectionDisplayable.swift
//  Robots
//
//  Created by Ivan Smetanin on 03/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit

protocol CollectionDisplayable {}

extension UITableView: CollectionDisplayable {}
extension UICollectionView: CollectionDisplayable {}
