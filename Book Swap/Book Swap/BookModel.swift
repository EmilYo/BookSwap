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
    var author: String?
    var cover: NSURL {
        get {
            return NSURL(string: "http://ext2.lubimyczytac.pl/book/\(bookId!)/image?request={%22width%22:%22500%22,%22height%22:%22500%22}")!
        }
    }
    var rating: Float?
    
    init?(json: JSON) {
        bookId = "id" <~~ json
        url = "url" <~~ json
        title = "title" <~~ json
        author = "author" <~~ json
        rating = "rating" <~~ json
    }
}
