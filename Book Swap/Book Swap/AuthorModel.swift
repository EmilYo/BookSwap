//
//  AuthorModel.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 18.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import Gloss

struct AuthorModel: Decodable {
    var fullname: String?
    var url: String?
    
    init?(json: JSON) {
        fullname = "fullname" <~~ json
        url = "url" <~~ json
    }
}
