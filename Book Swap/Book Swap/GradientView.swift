//
//  GradientView.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 19.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    @IBInspectable var startColor: UIColor = UIColor.blackColor().colorWithAlphaComponent(0.0) {
        didSet {
            reloadView()
        }
    }
    @IBInspectable var endColor: UIColor = UIColor.blackColor().colorWithAlphaComponent(0.5) {
        didSet {
            reloadView()
        }
    }
    
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0) {
        didSet {
            reloadView()
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0) {
        didSet {
            reloadView()
        }
    }
    
    override class func layerClass() -> AnyClass {
        return CAGradientLayer.self
    }
    
    override func awakeFromNib() {
        reloadView()
        backgroundColor = UIColor.clearColor()
    }
    
    private func reloadView() {
        configureGradientBackgroundWithColors([startColor, endColor])
    }
    
    func configureGradientBackgroundWithColors(colors: [UIColor]) {
        if let gradientLayer = layer as? CAGradientLayer {
            gradientLayer.colors = colors.map { $0.CGColor }
            
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint
            
            gradientLayer.shouldRasterize = true
            gradientLayer.rasterizationScale = UIScreen.mainScreen().scale
        }
    }
    
}
