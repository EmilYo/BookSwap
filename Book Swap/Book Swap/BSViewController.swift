//
//  BSViewController.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 18/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit

class BSViewController: UIViewController {
    
    private var emptyBookView: EmptyBookView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeButtonPressed(sender: AnyObject) {
        
    }
    
    func showEmptyView(title: String) {
        if (emptyBookView == nil) {
            emptyBookView = EmptyBookView(frame: view.bounds)
            view.addSubview(emptyBookView!)
//            UIView.animateWithDuration(1) { () -> Void in
//                self.emptyBookView?.alpha = 1
//            }
            
        }
        emptyBookView?.titleLabel?.text = title
    }
    
    func hideEmptyView() {
        if (emptyBookView != nil) {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.emptyBookView?.alpha = 0.0
                }, completion: { (Success) -> Void in
                    self.emptyBookView?.removeFromSuperview()
                    self.emptyBookView = nil
            })
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
