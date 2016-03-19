//
//  UserModel.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 18.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import Foundation
import Gloss

struct UserModel: Decodable {
    var userId: String?
    var firstName: String?
    var lastName: String?
    var avatar: NSURL?
    var email: String?
    
    init?(json: JSON) {
        userId = "id" <~~ json
        firstName = "first_name" <~~ json
        lastName = "last_name" <~~ json
        avatar = NSURL(string: ("avatar" <~~ json)!)
        email = "email" <~~ json
    }
}
