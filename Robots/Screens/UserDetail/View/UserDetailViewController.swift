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
        output?.viewLoaded()
    }

    // MARK: - UserDetailViewInput

    func setupInitialState() {

    }

}
