//
//  MatchViewModel.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 19.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import Foundation
import Gloss

class MatchViewModel {
    private let matchEndpoint = "/matches/"
    
    var matches: [MatchModel]?
    
    func downloadMatches(completion: (error: NSError?) -> Void) {
        NetworkHelper.authorizedRequest(.GET, endpoint: matchEndpoint, parameters: nil) { (response) -> Void in
            if response.result.error != nil {
                completion(error: response.result.error)
            } else {
                if let json = response.result.value as? [JSON] {
                    self.matches = [MatchModel].fromJSONArray(json)
                    completion(error: nil)
                } else {
                    completion(error: ErrorHelper.error)
                }
            }
        }
    }
}