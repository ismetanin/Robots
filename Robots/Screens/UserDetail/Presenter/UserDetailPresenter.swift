//
//  UserDetailPresenter.swift
//  Robots
//
//  Created by Ivan Smetanin on 27/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

final class UserDetailPresenter: UserDetailViewOutput, UserDetailModuleInput {

    // MARK: - Properties

    weak var view: UserDetailViewInput?
    var router: UserDetailRouterInput?
    var output: UserDetailModuleOutput?

    // MARK: - UserDetailViewOutput

    func viewLoaded() {
        view?.setupInitialState()
    }

    // MARK: - UserDetailModuleInput

}
