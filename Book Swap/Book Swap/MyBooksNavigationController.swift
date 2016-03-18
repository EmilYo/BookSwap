//
//  MyBooksNavigationController.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 18/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class MyBooksNavigationController: BSNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureTabBar() {
        let tabAnimation = RAMBounceAnimation()
        tabAnimation.textSelectedColor = UIColor(named: .TabBarSelectedText)
        tabAnimation.iconSelectedColor = UIColor(named: .TabBarSelectedIcon)
        
        let tabBarItem = RAMAnimatedTabBarItem(title: L10n.LocTabMyBooks.string, image: UIImage.Asset.TabMyBooks.image, selectedImage: nil)
        tabBarItem.textColor = UIColor(named: .TabBarText)
        tabBarItem.iconColor = UIColor(named: .TabBarIcon)
        tabBarItem.animation = tabAnimation
        
        self.tabBarItem = tabBarItem

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
