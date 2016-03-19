//
//  EmptyBookView.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 19/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import SnapKit

class EmptyBookView: UIView {
    
    var titleLabel: UILabel?
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareComponent()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func prepareComponent() {
        backgroundColor = UIColor.whiteColor()
        titleLabel = UILabel(frame: .zero)
        addSubview(titleLabel!)
        
        titleLabel!.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(titleLabel!.superview!)
            make.left.equalTo(titleLabel!.superview!).offset(15)
            make.right.equalTo(titleLabel!.superview!).offset(-15)
        }
        titleLabel?.textAlignment = .Center
    }
}
