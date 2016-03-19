//
//  WantedViewController.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 18/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit

class WantedViewController: BSViewController {
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.registerNib(UINib(nibName: BookCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        }
    }

    private var bookViewModel = BookViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = L10n.LocTabWanted.string
        automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        bookViewModel.wantedBooks { (error) -> Void in
            if error != nil {
                //TODO: Handle error
            } else {
                self.collectionView.reloadData()
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WantedViewController: UICollectionViewDataSource {
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

extension WantedViewController: UICollectionViewDelegate {
    
}

extension WantedViewController: UICollectionViewDelegateFlowLayout {
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

