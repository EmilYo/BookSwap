//
//  MatchTableViewCell.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 19.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        leftImageView.hnk_cancelSetImage()
        rightImageView.hnk_cancelSetImage()
        leftImageView.image = nil
        rightImageView.image = nil
    }
    
}
