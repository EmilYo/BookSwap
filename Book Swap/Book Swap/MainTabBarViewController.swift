//
//  MainTabBarViewController.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 18/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class MainTabBarViewController: RAMAnimatedTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func configureTabBar() {
        delegate = self
        var controllers = [UIViewController]()
        
//        let myBooksNavigationController = StoryboardScene.Cruises.instanciateCruisesNavigationController()
//        myBooksNavigationController.configureTabBar()
//        myBooksNavigationController.tabBarItem.tag = ControllerType.Cruises.rawValue
//        
//        controllers.append(myBooksNavigationController)
        

    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    
}
