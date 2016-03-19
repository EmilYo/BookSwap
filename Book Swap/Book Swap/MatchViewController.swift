//
//  MatchViewController.swift
//  Book Swap
//
//  Created by Mateusz Tylman on 18/03/16.
//  Copyright © 2016 Book Swap Team. All rights reserved.
//

import UIKit

class MatchViewController: BSViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerNib(UINib(nibName: MatchTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MatchTableViewCell.identifier)
            tableView.tableFooterView = UIView()
        }
    }

    private var matchViewModel = MatchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = L10n.LocMatchTitle.string
        automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    func loadData() {
        matchViewModel.downloadMatches { (error) -> Void in
            if error != nil {
                //TODO: do it
            } else {
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MatchViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchViewModel.matches?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MatchTableViewCell.identifier, forIndexPath: indexPath) as? MatchTableViewCell
        
        cell?.prepareForReuse()
        
        let match = matchViewModel.matches![indexPath.row]
        
        if let myBookUrl = match.bookHeWants?.cover {
            cell?.leftImageView.hnk_setImageFromURL(myBookUrl)
        }
        cell?.leftLabel.text = match.bookHeWants!.title!
        
        if let otherBookUrl = match.bookYouWant?.cover {
            cell?.rightImageView.hnk_setImageFromURL(otherBookUrl)
        }
        cell?.rightLabel.text = match.bookYouWant!.title!
        
        cell?.userNameLabel.text = "\(match.user!.firstName!) \(match.user!.lastName!)"
        cell?.emailLabel.text = match.user!.email!
        if let url = match.user!.avatar {
            cell?.avatarImageView.hnk_setImageFromURL(url)
        }

        return cell!
    }
}

extension MatchViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if let match = matchViewModel.matches?[indexPath.row],
            let user = match.user,
            let url = NSURL(string: "mailto:\(user.email!)") where UIApplication.sharedApplication().canOpenURL(url) {
                UIApplication.sharedApplication().openURL(url)
        }
        
    }
}
