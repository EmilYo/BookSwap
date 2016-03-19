//
//  Constans.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 18.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

struct Constans {
    
    //Staging
    static let apiUrl = "http://188.166.149.143"
    
    static let facebookPermissions = ["email", "public_profile", "user_friends"]
    
    enum DefualtKey: String {
        case UserToken = "UserToken"
        case ApnToken = "ApnToken"
    }
    
    enum NotificationKey: String {
        case BookAdded = "BookAdded"
        case UserLogged = "UserLogged"
    }
}