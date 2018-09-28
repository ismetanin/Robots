//
//  UserDetailViewController.swift
//  Robots
//
//  Created by Ivan Smetanin on 27/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit

final class UserDetailViewController: UIViewController, UserDetailViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: UserDetailViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.loadData()
        configureSubviews()
    }

    override func loadView() {
        super.loadView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutSubviews()
    }

    // MARK: - UserDetailViewInput

    func configure(with state: UserDetailViewState) {
        switch state {
        case .data(let user):
            self.title = user.firstname
        }
    }

    // MARK: - Private methods

    private func configureSubviews() {
        view.backgroundColor = .white
    }

    private func layoutSubviews() {

    }

}
