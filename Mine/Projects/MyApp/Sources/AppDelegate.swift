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
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.isTranslucent = false
        
        let homeVC = HomeViewController.create() ?? UIViewController()
        homeVC.tabBarItem = .init(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 0)
        
        let mypageVC = MyPageViewController()
        mypageVC.tabBarItem = UITabBarItem(title: "MyPage", image: CommonUIAsset.mypageIcon.image, tag: 1)
        
        tabBarController.setViewControllers([homeVC, mypageVC], animated: false)
        
        
        let viewController = ViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
    
}

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}
