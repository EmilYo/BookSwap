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
    private let offerEndpoint = "/books/offer/"
    private let wantEndpoint = "/books/want/"
    private let nearbyEndpoint = "/books/nearby"
    
    var books: [BookModel]?
    
    var selectedBook: BookModel?
    
    func searchBook(string: String, completion: (error: NSError?) -> Void) {
        NetworkHelper.request(.GET, endpoint: searchEndpoint + string.URLString, parameters: nil) { (response) -> Void in
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
    
    func offerBook(completion: (error: NSError?) -> Void) {
        guard selectedBook != nil else {
            completion(error: ErrorHelper.error)
            return
        }
        
        NetworkHelper.authorizedRequest(.POST, endpoint: offerEndpoint + "\(selectedBook!.bookId!)", parameters: nil) { (response) -> Void in
            if response.result.error != nil {
                completion(error: response.result.error)
            } else {
                completion(error: nil)
            }
        }
    }
    
    func wantBook(completion: (error: NSError?) -> Void) {
        guard selectedBook != nil else {
            completion(error: ErrorHelper.error)
            return
        }
        
        NetworkHelper.authorizedRequest(.POST, endpoint: wantEndpoint + "\(selectedBook!.bookId!)", parameters: nil) { (response) -> Void in
            if response.result.error != nil {
                completion(error: response.result.error)
            } else {
                completion(error: nil)
            }
        }
    }
    
    func nearbyBooks(completion: (error: NSError?) -> Void) {
        NetworkHelper.authorizedRequest(.GET, endpoint: nearbyEndpoint, parameters: nil) { (response) -> Void in
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
