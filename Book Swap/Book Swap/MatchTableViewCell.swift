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
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var rightLabel: UILabel!

    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.layer.cornerRadius = 25
        }
    }
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var emialImageView: UIImageView! {
        didSet {
            emialImageView.tintColor = UIColor(named: .NavBarTint)
        }
    }
    
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
        avatarImageView.hnk_cancelSetImage()
        leftImageView.image = nil
        rightImageView.image = nil
        avatarImageView.image = nil
    }
    
}
