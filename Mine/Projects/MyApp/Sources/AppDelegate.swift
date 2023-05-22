//
//  AppDelegate.swift
//  MyApp
//
//  Created by apple on 2023/05/19.
//

import UIKit

import Home
import MyPage

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let tabBarController = MainTabbarController()

        let homeVC = HomeViewController()
        homeVC.tabBarItem = .init(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 0)

        let mypageVC = MyPageViewController()
        mypageVC.tabBarItem = .init(tabBarSystemItem: .more, tag: 1)
        tabBarController.viewControllers = [homeVC, mypageVC]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

}

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .systemBlue
        self.tabBar.isTranslucent = false
    }
}
