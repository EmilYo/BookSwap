//
//  UserViewModel.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 18.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import Foundation
import Gloss

class UserViewModel {
    private let loginEndpoint = "/user/facebook"
    
    func loginUser(completion: (error: NSError?) -> Void) {
        
        var params: [String: AnyObject]?
        if let apnToken = NSUserDefaults.standardUserDefaults().stringForKey(Constans.DefualtKey.ApnToken.rawValue) {
            params = ["apn_token": apnToken]
        }
        
        NetworkHelper.authorizedRequest(.POST, endpoint: loginEndpoint, parameters: params) { (response) -> Void in
            if response.result.error != nil {
                completion(error: response.result.error)
            } else {
                completion(error: nil)
            }
        }
    }
}
