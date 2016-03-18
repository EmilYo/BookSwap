//
//  BookViewModel.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 18.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import Foundation
import Gloss

class BookViewModel {
    private let searchEndpoint = "/books/search/"
    
    var books = [BookModel]()
    
    func searchBook(string: String, completion: (error: NSError?) -> Void) {
        NetworkHelper.authorizedRequest(.GET, endpoint: searchEndpoint + string.URLString, parameters: nil) { (response) -> Void in
            if response.result.error != nil {
                completion(error: response.result.error)
            } else {
                if let json = response.result.value as? [JSON] {
                    self.books = [BookModel].fromJSONArray(json)
                    completion(error: nil)
                } else {
                    completion(error: ErrorHelper.error)
                }
            }
        }
    }
}