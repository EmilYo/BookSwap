//
//  Appearance.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 18/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import AFImageHelper

class Appearance {
    static func configure() {
        UINavigationBar.appearance().tintColor = UIColor(named: .TabBarIcon)
        UINavigationBar.appearance().setBackgroundImage(UIImage(color: UIColor(named: .MainColor).colorWithAlphaComponent(0.8)), forBarMetrics: .Default)
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor(named: .TabBarSelectedText),
            NSFontAttributeName: UIFont.systemFontOfSize(17, weight: UIFontWeightRegular)
        ]
        UINavigationBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().tintColor = UIColor(named: .MainColor)
        UITabBar.appearance().barTintColor = UIColor(named: .MainColor)
        
    }
}
