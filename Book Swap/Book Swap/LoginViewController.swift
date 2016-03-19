//
//  LoginViewController.swift
//  Book Swap
//
//  Created by Kamil Powałowski on 18.03.2016.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: BSViewController {
    @IBOutlet weak var label: UILabel! {
        didSet {
            label.text = L10n.LocLoginLabel.string
        }
    }

    @IBOutlet weak var loginButton: FBSDKLoginButton! {
        didSet {
            loginButton.readPermissions = Constans.facebookPermissions
            loginButton.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.LocLoginTitle.string
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension LoginViewController: FBSDKLoginButtonDelegate {
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error != nil {
            //TODO: Handle error
        } else {
            if let token = result.token.tokenString {
                NSUserDefaults.standardUserDefaults().setObject(token, forKey: Constans.DefualtKey.UserToken.rawValue)
                let userViewModel = UserViewModel()
                userViewModel.loginUser({ (error) -> Void in
                    if error != nil {
                        //TODO: handle error
                    } else {
                        NSNotificationCenter.defaultCenter().postNotificationName(Constans.NotificationKey.UserLogged.rawValue, object: nil)
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                })
            }

        }
    }
}
