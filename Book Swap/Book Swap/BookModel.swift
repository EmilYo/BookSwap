//
//  BookModel.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 18.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import Gloss

struct BookModel: Decodable {
    var bookId: Int?
    var url: String?
    var title: String?
    var authors: [AuthorModel]?
    var cover: String?
    var rating: Float?
    
    init?(json: JSON) {
        bookId = "id" <~~ json
        url = "url" <~~ json
        title = "title" <~~ json
        authors = "authors" <~~ json
        cover = "cover" <~~ json
        rating = "rating" <~~ json
    }
}