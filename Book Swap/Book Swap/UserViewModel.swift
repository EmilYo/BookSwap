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
    private let userEndPoint = "/user/profile/"
    
    var me: UserModel?
    
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
    
    func getMe(completion: (error: NSError?) -> Void) {
        NetworkHelper.authorizedRequest(.GET, endpoint: userEndPoint, parameters: nil) { (response) -> Void in
            if response.result.error != nil {
                completion(error: response.result.error)
            } else {
                if let json = response.result.value as? JSON {
                    self.me = UserModel(json: json)
                    completion(error: nil)
                } else {
                    completion(error: ErrorHelper.error)
                }

            }
        }
    }
}
