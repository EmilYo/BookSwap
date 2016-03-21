//
//  Constans.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 18.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

struct Constans {
    
    //Staging
    static let apiUrl = "server_address" //TODO: Place server address here
    
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
