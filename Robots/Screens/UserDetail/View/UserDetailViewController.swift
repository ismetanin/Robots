//
//  UserDetailViewController.swift
//  Robots
//
//  Created by Ivan Smetanin on 27/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit

final class UserDetailViewController: UIViewController, UserDetailViewInput, ModuleTransitionable {

    // MARK: - Subviews

    private lazy var imageView = UIImageView()

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
        view.addSubview(imageView)
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
            self.imageView.loadImage(
                with: user.photoStringURL,
                placeholder: Asset.imgAvatarPlaceholder.image
            )
        }
    }

    // MARK: - Private methods

    private func configureSubviews() {
        view.backgroundColor = .white
    }

    private func layoutSubviews() {
        imageView.pin
            .top(view.pin.safeArea)
            .start(view.pin.safeArea)
            .width(75)
            .height(75)
            .margin(16)
    }

}
