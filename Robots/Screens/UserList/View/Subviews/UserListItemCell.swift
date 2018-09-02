//
//  UserListItemCell.swift
//  Robots
//
//  Created by Ivan Smetanin on 01/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit
import PinLayout

final class UserListItemCell: UITableViewCell {

    // MARK: - Subviews

    private let userImageView = UIImageView()
    private let userNameLabel = UILabel()

    // MARK: - Constants

    static let reuseIdentifier: String = String(describing: UserListItemCell.self)

    private enum Constants {
        static let defaultMargin: CGFloat = 8
        static let imageViewSize: CGSize = CGSize(width: 42, height: 42)
        static let userNameLabelFontSize: CGFloat = 16
        static let imageViewPlaceholder: UIImage = #imageLiteral(resourceName: "imgAvatarPlaceholder")
    }

    // MARK: - Initialization and deinitialization

    init() {
        super.init(style: .default, reuseIdentifier: UserListItemCell.reuseIdentifier)
        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - UITableViewCell

    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }

    // MARK: - Internal methods

    func configure(with user: User) {
        self.userNameLabel.text = user.firstname + " " + user.lastname
        self.userImageView.loadImage(with: user.photoURL, placeholder: Constants.imageViewPlaceholder)
    }

    // MARK: - Private methods

    private func setupSubviews() {
        backgroundColor = .white

        userNameLabel.numberOfLines = 1
        userNameLabel.font = UIFont.systemFont(ofSize: Constants.userNameLabelFontSize)
        userNameLabel.textColor = .black
        contentView.addSubview(userNameLabel)

        userImageView.image = Constants.imageViewPlaceholder
        userImageView.clipsToBounds = true
        contentView.addSubview(userImageView)
    }

    private func layout() {
        userImageView.pin
            .start(contentView.pin.safeArea)
            .top(contentView.pin.safeArea)
            .bottom(contentView.pin.safeArea)
            .height(Constants.imageViewSize.height)
            .width(Constants.imageViewSize.width)
            .margin(Constants.defaultMargin)

        userImageView.layer.cornerRadius = Constants.imageViewSize.width / 2

        userNameLabel.pin
            .vCenter()
            .after(of: userImageView)
            .end(contentView.pin.safeArea)
            .margin(Constants.defaultMargin)
            .height(Constants.userNameLabelFontSize)
    }

}
