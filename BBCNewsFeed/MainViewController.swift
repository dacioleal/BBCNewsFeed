//
//  MainViewController.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 10/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let newsManager = NewsManager.sharedManager
    var tableView : UITableView!
    
    override func loadView() {
        
        let backView = UIView()
        
        tableView = UITableView()
        backView.addSubview(tableView)
        
        //Autolayout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let views : [String : UIView] = ["tableView" : tableView]
        
        let constraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: .alignAllLeft, metrics: nil, views: views)
        let constraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: .alignAllLeft, metrics: nil, views: views)
        
        backView.addConstraints(constraintsH)
        backView.addConstraints(constraintsV)
        self.view = backView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let operation = NewsDownloadOperation()
        operation.itemParserDelegate = newsManager
        newsManager.operationQueue.addOperation(operation)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.register(NewsTableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "NewsCell")
        
        tableView.dataSource = newsManager
        tableView.delegate = newsManager
        self.perform(#selector(MainViewController.reload), with: nil, afterDelay: 2.0)
    }
    
    func reload() {
        tableView.reloadData()
    }

}
