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

    // MARK: - UserListViewOutput

    func loadData() {
        view?.configure(with: UserListViewState.data(
            users: [
                User(id: 0, firstname: "John", lastname: "Smith", photoURL: "", about: "About", phone: "+79537003117", email: "jsmth@gmail.com", company: "", address: "")
            ])
        )
    }

}
