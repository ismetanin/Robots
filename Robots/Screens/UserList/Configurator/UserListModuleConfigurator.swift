//
//  UserListModuleConfigurator.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit

final class UserListModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: UserListModuleOutput? = nil) -> UserListViewController {
        let view = UserListViewController()
        let presenter = UserListPresenter()
        let router = UserListRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        presenter.service = UsersServiceFactory().produce()

        router.view = view

        view.output = presenter
        view.adapter = UserListTableViewAdapter()

        return view
    }

}
