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
    private var user: User?

    // MARK: - UserDetailViewOutput

    func loadData() {
        guard let user = user else {
            return
        }
        view?.configure(with: .data(user: user))
    }

    // MARK: - UserDetailModuleInput

    func setup(with user: User) {
        self.user = user
    }

}
