//
//  MatchModel.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 19.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import Gloss

struct MatchModel: Decodable {
    var user: UserModel?
    var bookHeWants: BookModel?
    var bookYouWant: BookModel?
    
    init?(json: JSON) {
        user = "user" <~~ json
        bookHeWants = "book_he_wants" <~~ json
        bookYouWant = "book_you_want" <~~ json
    }
}
