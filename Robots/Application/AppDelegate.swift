//
//  AppDelegate.swift
//  Robots
//
//  Created by Ivan Smetanin on 19/08/2018.
//Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
        initializeRootView()
        return true
    }

    // MARK: - Private methods

    private func initializeRootView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let userListView = UserListModuleConfigurator().configure()
        let root = UINavigationController(rootViewController: userListView)
        window?.rootViewController = root
        window?.makeKeyAndVisible()
    }

}
