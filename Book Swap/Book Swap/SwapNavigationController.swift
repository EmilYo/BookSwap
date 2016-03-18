//
//  SwapNavigationController.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 18/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class SwapNavigationController: BSNavigationController {

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
        tabAnimation.textSelectedColor = UIColor(named: .Second)
        tabAnimation.iconSelectedColor = UIColor(named: .Second)
        
        let tabBarItem = RAMAnimatedTabBarItem(title: "Swap", image: UIImage.Asset.TabSwap.image, selectedImage: nil)
        tabBarItem.textColor = UIColor.whiteColor()
        tabBarItem.iconColor = UIColor.whiteColor()
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
