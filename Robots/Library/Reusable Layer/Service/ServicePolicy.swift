//
//  ServicePolicy.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/10/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

enum ServicePolicy {
    case networkOnly
    case cacheOnly
    case firstCacheThenRefreshFromServer
    case firstServerThenRefreshFromCache
}
