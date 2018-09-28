//
//  UserListRouter.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

final class UserListRouter: UserListRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - UserListRouterInput

    func showUserDetailModule(with user: User) {
        let module = UserDetailModuleConfigurator().configure(user: user)
        view?.push(module: module, animated: true)
    }

}
