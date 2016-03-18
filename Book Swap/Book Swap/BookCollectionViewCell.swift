//
//  BookCollectionViewCell.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 18.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import GradientView

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
