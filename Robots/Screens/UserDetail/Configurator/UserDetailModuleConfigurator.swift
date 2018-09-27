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

    func configure(output: UserDetailModuleOutput? = nil) -> UserDetailViewController {
        guard let view = UIStoryboard(name: String(describing: UserDetailViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? UserDetailViewController else {
            fatalError("Can't load UserDetailViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = UserDetailPresenter()
        let router = UserDetailRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
