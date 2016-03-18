//
//  BookOverlayView.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 18/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import Koloda

private let overlayRightImageName = "overlay_like"
private let overlayLeftImageName = "overlay_skip"

class BookOverlayView: OverlayView {
    

    @IBOutlet weak var bookImageView: UIImageView!


    override var overlayState:OverlayMode  {
        didSet {
            switch overlayState {
            case .Left :
                bookImageView.image = UIImage(named: overlayLeftImageName)
            case .Right :
                bookImageView.image = UIImage(named: overlayRightImageName)
            default:
                bookImageView.image = nil
            }
            
        }
    }


}
