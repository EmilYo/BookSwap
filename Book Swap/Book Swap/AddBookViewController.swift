//
//  AddBookViewController.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 19.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import Async
import PKHUD

class AddBookViewController: BSViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.registerNib(UINib(nibName: BookCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        }
    }
    
    private let bookViewModel = BookViewModel()
    
    private var async: Async?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = L10n.LocAddBookTitle.string
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "cancelButton:")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancelButton(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension AddBookViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        async?.cancel()
        async = Async.main(after: 5, block: { [weak self]() -> Void in
            self?.searchBarSearchButtonClicked(searchBar)
        })
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        async?.cancel()
        searchBar.resignFirstResponder()
        guard searchBar.text?.characters.count > 0 else { return }
        HUD.show(.Progress)
        bookViewModel.searchBook(searchBar.text!) { (error) -> Void in
            HUD.hide()
            if error != nil {
                //TOOD: handle
            } else {
                self.collectionView.reloadData()
            }
        }
    }
}

extension AddBookViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookViewModel.books?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(BookCollectionViewCell.identifier, forIndexPath: indexPath) as? BookCollectionViewCell
        let book = bookViewModel.books?[indexPath.row]
        cell?.imageView.hnk_cancelSetImage()
        cell?.imageView.hnk_setImageFromURL(book!.cover)
        cell?.titleLabel.text = book?.title
        cell?.authorLabel.text = book?.author
        
        return cell!
    }
}

extension AddBookViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        let book = bookViewModel.books![indexPath.row]
        bookViewModel.selectedBook = book
        bookViewModel.offerBook { (error) -> Void in
            if error != nil {
                //TOOD: handle
            } else {
                NSNotificationCenter.defaultCenter().postNotificationName(Constans.NotificationKey.BookAdded.rawValue, object: nil)
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
}

extension AddBookViewController: UICollectionViewDelegateFlowLayout {
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

