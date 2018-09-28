//
//  UserDetailModuleConfigurator.swift
//  Robots
//
//  Created by Ivan Smetanin on 27/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit

final class UserDetailModuleConfigurator {

    // MARK: - Internal methods

    func configure(user: User, output: UserDetailModuleOutput? = nil) -> UserDetailViewController {
        let view = UserDetailViewController()
        let presenter = UserDetailPresenter()
        let router = UserDetailRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        presenter.setup(with: user)

        router.view = view
        view.output = presenter

        return view
    }

}
