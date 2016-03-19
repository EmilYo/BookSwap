//
//  ProfileViewController.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 18/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import ASValueTrackingSlider

class ProfileViewController: BSViewController {

    @IBOutlet weak var logoutButton: FBSDKLoginButton! {
        didSet {
            logoutButton.readPermissions = Constans.facebookPermissions
            logoutButton.delegate = self
        }
    }
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var slider: ASValueTrackingSlider! {
        didSet {
            slider.tintColor = UIColor(named: .NavBarTint)
            slider.minimumValue = 1
            slider.maximumValue = 50
            slider.value = 5
            slider.continuous = false
            slider.dataSource = self
            slider.popUpViewColor = UIColor(named: .NavBarTint)
        }
    }
    private var userViewModel = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = L10n.LocProfileTitle.string
        avatarImageView.layer.cornerRadius = 40
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getMe()
    }
    
    func getMe() {
        userViewModel.getMe { (error) -> Void in
            if error != nil {
                
            } else {
                self.prepareProfile()
            }
        }
    }
    func prepareProfile() {
        if let me = userViewModel.me {
            nameLabel.text = "\(me.firstName!) \(me.lastName!)"
            emailLabel.text = me.email!
            if let url = me.avatar {
                avatarImageView.hnk_setImageFromURL(url)
            }
        }
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

extension ProfileViewController: FBSDKLoginButtonDelegate {
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: Constans.DefualtKey.UserToken.rawValue)
        presentViewController(StoryboardScene.Login.initialViewController(), animated: true, completion: nil)
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        loginButtonDidLogOut(loginButton)
    }
}

extension ProfileViewController: ASValueTrackingSliderDataSource {
    func slider(slider: ASValueTrackingSlider!, stringForValue value: Float) -> String! {
        let formmater = NSNumberFormatter()
        formmater.allowsFloats = false
        return "\(formmater.stringFromNumber(value)!) km"
    }
}

