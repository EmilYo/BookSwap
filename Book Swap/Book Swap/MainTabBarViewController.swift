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

    private enum ControllerType: Int {
        case MyBooks, Wanted, Swap, Match, Profile
    }
    
    
    override func viewDidLoad() {
        configureTabBar()
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        //checkLogin()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func checkLogin() {
        guard NSUserDefaults.standardUserDefaults().stringForKey(Constans.DefualtKey.UserToken.rawValue) == nil else { return }
        
        presentViewController(StoryboardScene.Login.initialViewController(), animated: true, completion: nil)
    }
    
    private func configureTabBar() {
        delegate = self
        var controllers = [UIViewController]()
        
        let myBooksNavigationController = StoryboardScene.MyBooks.instantiateMyBooksNavigationController()
        myBooksNavigationController.configureTabBar()
        myBooksNavigationController.tabBarItem.tag = ControllerType.MyBooks.rawValue

        controllers.append(myBooksNavigationController)
        
        let wantedNavigationController = StoryboardScene.Wanted.instantiateWantedNavigationController()
        wantedNavigationController.configureTabBar()
        wantedNavigationController.tabBarItem.tag = ControllerType.MyBooks.rawValue
        
        controllers.append(wantedNavigationController)
        
        let swapNavigationController = StoryboardScene.Swap.instantiateSwapNavigationController()
        swapNavigationController.configureTabBar()
        swapNavigationController.tabBarItem.tag = ControllerType.MyBooks.rawValue
        
        controllers.append(swapNavigationController)
        
        let matchNavigationController = StoryboardScene.Match.instantiateMatchNavigationController()
        matchNavigationController.configureTabBar()
        matchNavigationController.tabBarItem.tag = ControllerType.MyBooks.rawValue
        
        controllers.append(matchNavigationController)
        
        let profileNavigationController = StoryboardScene.Profile.instantiateProfileNavigationController()
        profileNavigationController.configureTabBar()
        profileNavigationController.tabBarItem.tag = ControllerType.MyBooks.rawValue
        
        controllers.append(profileNavigationController)
        
        viewControllers = controllers
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    
}
