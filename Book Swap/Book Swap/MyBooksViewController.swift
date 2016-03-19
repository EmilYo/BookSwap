//
//  MyBooksViewController.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 18/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import Haneke

class MyBooksViewController: BSViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.registerNib(UINib(nibName: BookCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        }
    }
    
    private var bookViewModel = BookViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = L10n.LocTabMyBooks.string
        automaticallyAdjustsScrollViewInsets = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNewBook:")
        loadData()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedNotifications:", name: Constans.NotificationKey.UserLogged.rawValue, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedNotifications:", name: Constans.NotificationKey.BookAdded.rawValue, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addNewBook(sender: UIBarButtonItem) {
        performSegue(StoryboardSegue.MyBooks.PresentAddBookNavigationController)
    }
    
    func trashBook(sender: UIBarButtonItem) {

    }
    
    func loadData() {
        bookViewModel.offeredBooks { (error) -> Void in
            if error != nil {
                //TODO: Handle error
            } else {
                if (self.bookViewModel.books?.count > 0) {
                    self.hideEmptyView()
                }
                self.collectionView.reloadData()
            }
        }
    }
    
    func receivedNotifications(notification: NSNotification) {
        loadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func reset(sender: UISwipeGestureRecognizer) {
        if let cell = sender.view as? UICollectionViewCell {
            let i = collectionView.indexPathForCell(cell)!.item
            bookViewModel.selectedBook = bookViewModel.books![i]
        }
        
        let alertController = UIAlertController(title: L10n.LocWarning.string, message: L10n.LocTrashBookMessage.string, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: L10n.LocNo.string, style: .Cancel) { (UIAlertAction) -> Void in
            
        }
        alertController.addAction(cancelAction)
        let yesAction = UIAlertAction(title: L10n.LocYes.string, style: .Destructive) { (UIAlertAction) -> Void in
            self.removeSelectedBook()
        }
        alertController.addAction(yesAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func removeSelectedBook() {
        bookViewModel.trashBook { (error) -> Void in
            if error != nil {
                //TODO: Handle error
            } else {
                self.loadData()
            }
        }
    }

}

extension MyBooksViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let books = bookViewModel.books {
            if books.count == 0 {
                showEmptyView(L10n.LocMyBooksEmpty.string)
            }
        }
        return bookViewModel.books?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(BookCollectionViewCell.identifier, forIndexPath: indexPath) as? BookCollectionViewCell
        let book = bookViewModel.books?[indexPath.row]
        cell?.imageView.hnk_cancelSetImage()
        cell?.imageView.hnk_setImageFromURL(book!.cover)
        cell?.titleLabel.text = book?.title
        cell?.authorLabel.text = book?.author
    
        let UpSwipe = UISwipeGestureRecognizer(target: self, action: "reset:")
        UpSwipe.direction = UISwipeGestureRecognizerDirection.Left
        cell?.addGestureRecognizer(UpSwipe)
        
        return cell!
    }

}

extension MyBooksViewController: UICollectionViewDelegate {
    
}

extension MyBooksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = collectionView.frame.width / 2
        return CGSize(width: width - 14, height: width / 3 * 4)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 2
    }
}
