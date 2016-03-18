//
//  UIView+Identifier.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 18.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit

extension UIView {
    static var identifier: String {
        get {
            return NSStringFromClass(self).componentsSeparatedByString(".").last!
        }
    }
}