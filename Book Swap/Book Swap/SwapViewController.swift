//
//  SwapViewController.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 18/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import Koloda
import pop

private let numberOfCards: UInt = 4
private let frameAnimationSpringBounciness:CGFloat = 9
private let frameAnimationSpringSpeed:CGFloat = 16
private let kolodaCountOfVisibleCards = 2
private let kolodaAlphaValueSemiTransparent:CGFloat = 0.05

class SwapViewController: BSViewController {

    @IBOutlet weak var bookKolodaView: BookKolodaView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bookKolodaView.alphaValueSemiTransparent = kolodaAlphaValueSemiTransparent
        bookKolodaView.countOfVisibleCards = kolodaCountOfVisibleCards
        bookKolodaView.delegate = self
        bookKolodaView.dataSource = self
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func skipButtonAction(sender: AnyObject) {
        bookKolodaView?.swipe(SwipeResultDirection.Left)
        
    }
    @IBAction func likeButtonAction(sender: AnyObject) {
        bookKolodaView?.swipe(SwipeResultDirection.Right)
    }
}

//MARK: KolodaViewDelegate
extension SwapViewController: KolodaViewDelegate {
    func koloda(kolodaDidRunOutOfCards koloda: KolodaView) {
        //Example: reloading
        bookKolodaView.resetCurrentCardNumber()
    }
    
    func koloda(koloda: KolodaView, didSelectCardAtIndex index: UInt) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://yalantis.com/")!)
    }
    
    func koloda(kolodaShouldApplyAppearAnimation koloda: KolodaView) -> Bool {
        return true
    }
    
    func koloda(kolodaShouldMoveBackgroundCard koloda: KolodaView) -> Bool {
        return false
    }
    
    func koloda(kolodaShouldTransparentizeNextCard koloda: KolodaView) -> Bool {
        return true
    }
    
    func koloda(kolodaBackgroundCardAnimation koloda: KolodaView) -> POPPropertyAnimation? {
        let animation = POPSpringAnimation(propertyNamed: kPOPViewFrame)
        animation.springBounciness = frameAnimationSpringBounciness
        animation.springSpeed = frameAnimationSpringSpeed
        return animation
    }
}

//MARK: KolodaViewDataSource
extension SwapViewController: KolodaViewDataSource {
    
    func koloda(kolodaNumberOfCards koloda:KolodaView) -> UInt {
        return numberOfCards
    }
    
    func koloda(koloda: KolodaView, viewForCardAtIndex index: UInt) -> UIView {
        let bookTinderTabView = NSBundle.mainBundle().loadNibNamed("BookTinderTabView", owner: self, options: nil)[0] as? BookTinderTabView
        bookTinderTabView?.bookImageView.image = UIImage(named: "Book_\(index + 1)")
        return bookTinderTabView!
    }
    
    func koloda(koloda: KolodaView, viewForCardOverlayAtIndex index: UInt) -> OverlayView? {
        return NSBundle.mainBundle().loadNibNamed("BookOverlayView",
            owner: self, options: nil)[0] as? OverlayView
    }
}

