//
//  UserListViewController.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit
import PinLayout

final class UserListViewController: UIViewController, UserListViewInput, ModuleTransitionable {

    // MARK: - Subviews

    private let tableView = UITableView()
    private let activityIndicator = UIActivityIndicatorView()

    // MARK: - Properties

    var output: UserListViewOutput?
    var adapter: UserListViewAdapter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.loadData()
        configureAdapter()
        configureSubviews()
    }

    override func loadView() {
        super.loadView()
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutSubviews()
    }

    // MARK: - UserListViewInput

    func configure(with state: UserListViewState) {
        switch state {
        case .data(let users):
            activityIndicator.stopAnimating()
            adapter?.configure(with: users)
        case .loading:
            activityIndicator.startAnimating()
        case .error:
            activityIndicator.stopAnimating()
            break
        }
    }

    // MARK: - Private methods

    private func configureAdapter() {
        adapter?.set(view: tableView)
        adapter?.didSelectUser = { [weak self] user in
            self?.output?.select(user: user)
        }
    }

    private func configureSubviews() {
        title = L10n.Userlist.title
        view.backgroundColor = .white
        activityIndicator.activityIndicatorViewStyle = .gray
        activityIndicator.hidesWhenStopped = true
    }

    private func layoutSubviews() {
        tableView.pin
            .top(view.pin.safeArea)
            .bottom(view.pin.safeArea)
            .start(view.pin.safeArea)
            .end(view.pin.safeArea)

        activityIndicator.pin
            .center()
    }

}
