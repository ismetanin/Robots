//
//  UserListTableViewAdapter.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit

final class UserListTableViewAdapter: NSObject {

    // MARK: - Constants

    private enum Constants {
        static let rowHeight: CGFloat = 58
    }

    // MARK: - Properties

    private var items: [User] = []
    private var tableView: UITableView?

    var didSelectUser: ((User) -> Void)?

    // MARK: - Internal helpers

    func set(tableView: UITableView) {
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = Constants.rowHeight
        tableView.register(UserListItemCell.self, forCellReuseIdentifier: UserListItemCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
    }

    func configure(with items: [User]) {
        self.items = items
        tableView?.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension UserListTableViewAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UserListItemCell()
        cell.configure(with: items[indexPath.row])
        return cell
    }

}

// MARK: - UITableViewDelegate

extension UserListTableViewAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelectUser?(items[indexPath.row])
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }

}
