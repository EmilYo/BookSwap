//
//  String+Double.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 19/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import Foundation

extension String {
    func toDouble() -> Double {
        if let unwrappedNum = Double(self) {
            return unwrappedNum
        } else {
            // Handle a bad number
            print("Error converting \"" + self + "\" to Double")
            return 0.0
        }
    }
}
