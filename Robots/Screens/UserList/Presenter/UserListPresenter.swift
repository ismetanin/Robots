//
//  UserListPresenter.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

final class UserListPresenter: UserListViewOutput, UserListModuleInput {

    // MARK: - Properties

    weak var view: UserListViewInput?
    var router: UserListRouterInput?
    var output: UserListModuleOutput?
    var service: UsersAbstractService?

    // MARK: - UserListViewOutput

    func loadData() {
        view?.configure(with: .loading)
        service?.getAll(onCompleted: { [weak self] users in
            self?.view?.configure(with: .data(users: users))
        }, onError: { [weak self] error in
            self?.view?.configure(with: .error(error: error))
        })
    }

    func select(user: User) {

    }

}
