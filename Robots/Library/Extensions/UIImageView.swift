//
//  UIImageView.swift
//  Robots
//
//  Created by Ivan Smetanin on 02/09/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {

    // MARK: - Constants

    private var transitionDuration: TimeInterval {
        return 0.33
    }

    // MARK: - Internal methods

    func loadImage(with urlString: String, placeholder: UIImage? = nil) {
        guard let url = URL(string: urlString) else {
            self.display(image: placeholder)
            return
        }
        self.loadImage(with: url, placeholder: placeholder)
    }

    func loadImage(with url: URL, placeholder: UIImage?) {
        Nuke.loadImage(
            with: url,
            options: ImageLoadingOptions(
                placeholder: placeholder,
                transition: .fadeIn(duration: transitionDuration)
            ),
            into: self
        )
    }

    // MARK: - Private methods

    // TODO: We don't use this method. Test placholder showing and delete or call this method.
    private func showPlacehoderIfPossible(placeholder: UIImage?) {
        guard let placeholder = placeholder else {
            return
        }
        UIView.transition(
            with: self,
            duration: transitionDuration,
            options: UIViewAnimationOptions.allowUserInteraction.union(.transitionCrossDissolve),
            animations: {
                self.display(image: placeholder)
            }
        )
    }

}
