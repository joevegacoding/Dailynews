//
//  BaseTabControllerViewController.swift
//  DailyNews
//
//  Created by Joseph Bouhanef on 2020-11-16.
//

import UIKit

class BaseTabControllerViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let purpleViewController = UIViewController()
        purpleViewController.view.backgroundColor = .systemBackground
        let cyanViewController = UIViewController()
        cyanViewController.view.backgroundColor = .systemBackground
        
        
        viewControllers = [
            createNavController(viewController: NewsViewController(), title: "News", imageName: "newspaper", selectedImage: "newspaper.fill"),
            createNavController(viewController: SearchViewController(), title: "Search", imageName: "magnifyingglass.circle", selectedImage: "magnifyingglass.circle.fill")
        ]
    }
    
    func createNavController(viewController: UIViewController, title: String, imageName: String, selectedImage: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.tabBarItem.selectedImage = UIImage(systemName: selectedImage)
        tabBar.tintColor = (.label)
        return navController
    }
}
