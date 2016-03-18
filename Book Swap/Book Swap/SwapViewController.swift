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
import Haneke

private let numberOfCards: UInt = 4
private let frameAnimationSpringBounciness:CGFloat = 9
private let frameAnimationSpringSpeed:CGFloat = 16
private let kolodaCountOfVisibleCards = 2
private let kolodaAlphaValueSemiTransparent:CGFloat = 0.00

class SwapViewController: BSViewController {

    @IBOutlet weak var bookKolodaView: BookKolodaView!
    private var bookViewModel =  BookViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBookKolodaView()
        
        navigationItem.title = L10n.LocTabSwap.string
        
        bookViewModel.nearbyBooks { (error) -> Void in
            if error != nil {
                
            }
            self.bookKolodaView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    func configureBookKolodaView() {
        bookKolodaView.alphaValueSemiTransparent = kolodaAlphaValueSemiTransparent
        bookKolodaView.countOfVisibleCards = kolodaCountOfVisibleCards
        bookKolodaView.delegate = self
        bookKolodaView.dataSource = self
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
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
        if let book = bookViewModel.books?[Int(index)] {
            UIApplication.sharedApplication().openURL(book.url)
        }
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
        if let books = bookViewModel.books {
            return UInt(books.count)
        }
        return 0
    }
    
    func koloda(koloda: KolodaView, viewForCardAtIndex index: UInt) -> UIView {
        let bookTinderTabView = NSBundle.mainBundle().loadNibNamed("BookTinderTabView", owner: self, options: nil)[0] as? BookTinderTabView
        if let book = bookViewModel.books?[Int(index)] {
            bookTinderTabView?.bookImageView.hnk_setImageFromURL(book.cover)
            bookTinderTabView?.titleLabel.text = book.title
            bookTinderTabView?.authorLabel.text = book.author
        }
        bookTinderTabView?.layer.cornerRadius = 5
        
        return bookTinderTabView!
    }
    
    func koloda(koloda: KolodaView, viewForCardOverlayAtIndex index: UInt) -> OverlayView? {
        return NSBundle.mainBundle().loadNibNamed("BookOverlayView",
            owner: self, options: nil)[0] as? OverlayView
    }
}

