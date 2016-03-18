//
//  BookModel.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 18.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import Gloss

struct BookModel: Decodable {
    var bookId: String?
    var url: NSURL {
        get {
            return NSURL(string: "http://lubimyczytac.pl/ksiazka/295040/\(bookId!)")!
        }
    }
    var title: String?
    var author: String?
    var cover: NSURL {
        get {
            return NSURL(string: "http://ext2.lubimyczytac.pl/book/\(bookId!)/image?request=%7B%22width%22:%22500%22,%22height%22:%22600%22%7D")!
        }
    }
    var rating: Float?
    
    init?(json: JSON) {
        bookId = "id" <~~ json
        title = "title" <~~ json
        author = "author" <~~ json
        rating = "rating" <~~ json
    }
}
