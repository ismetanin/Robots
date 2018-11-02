//
//  UserDetailViewController.swift
//  Robots
//
//  Created by Ivan Smetanin on 27/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit

final class UserDetailViewController: UIViewController, UserDetailViewInput, ModuleTransitionable {

    // MARK: - Constants

    private enum Constants {
        static let imageViewSize: CGSize = CGSize(width: 75, height: 75)
        static let margin: CGFloat = 16
        static let userNameLabelFont: UIFont = UIFont.systemFont(
            ofSize: 16,
            weight: .medium
        )
    }

    // MARK: - Subviews

    private lazy var imageView = UIImageView()
    private lazy var userNameLabel = UILabel()

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
        view.addSubview(userNameLabel)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutSubviews()
    }

    // MARK: - UserDetailViewInput

    func configure(with state: UserDetailViewState) {
        switch state {
        case .data(let user):
            self.title = L10n.Userdetail.title
            self.userNameLabel.text = user.firstname + " " + user.lastname
            self.imageView.loadImage(
                with: user.photoStringURL,
                placeholder: Asset.imgAvatarPlaceholder.image
            )
        }
    }

    // MARK: - Private methods

    private func configureSubviews() {
        view.backgroundColor = .white

        userNameLabel.numberOfLines = 1
        userNameLabel.font = Constants.userNameLabelFont
        userNameLabel.textColor = .black
    }

    private func layoutSubviews() {
        imageView.pin
            .top(view.pin.safeArea)
            .start(view.pin.safeArea)
            .width(Constants.imageViewSize.width)
            .height(Constants.imageViewSize.height)
            .margin(Constants.margin)

        imageView.layer.cornerRadius = Constants.imageViewSize.width / 2

        userNameLabel.pin
            .after(of: imageView, aligned: .top)
            .height(Constants.userNameLabelFont.pointSize)
            .start(imageView.pin.safeArea)
            .end(view.pin.safeArea)
            .margin(Constants.margin)
    }

}
