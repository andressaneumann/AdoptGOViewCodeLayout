//
//  CustomTabBarController.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 10/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let homeViewController = HomeViewController(collectionViewLayout: layout)
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        homeNavController.title = "Home"
        homeNavController.tabBarItem.image = UIImage(named: "home-icon")
        
        
        viewControllers = [homeNavController]
    }
}
