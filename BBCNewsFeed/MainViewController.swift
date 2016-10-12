//
//  MainViewController.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 10/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    let newsManager = NewsManager.sharedManager
    var tableView : UITableView!
    
    override func loadView() {
        
        let backView = UIView()
        backView.backgroundColor = UIColor.white
        
        tableView = UITableView()
        tableView.separatorStyle = .none
        backView.addSubview(tableView)
        
        //Autolayout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let views : [String : UIView] = ["tableView" : tableView]
        let constraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[tableView]-10-|", options: .directionLeadingToTrailing, metrics: nil, views: views)
        let constraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: .alignAllLeft, metrics: nil, views: views)
        backView.addConstraints(constraintsH)
        backView.addConstraints(constraintsV)
        
        self.view = backView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "BBC News"
        
        let operation = NewsDownloadOperation()
        operation.itemParserDelegate = newsManager
        newsManager.operationQueue.addOperation(operation)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.register(NewsTableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "NewsCell")
        
        tableView.dataSource = newsManager
        tableView.delegate = self
        self.perform(#selector(MainViewController.reload), with: nil, afterDelay: 2.0)
        
        self.tableView.tableHeaderView = NewsTableHeaderView(frame: CGRect(origin: CGPoint.init(x: 0, y: 0), size: CGSize(width: tableView.frame.width, height: 50.0)))
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = newsManager.items[indexPath.row]
        let detailVC = DetailViewController()
        let webURL = URL(string: item.link)
        
        if let url = webURL {
            detailVC.loadWebPageWithUrl(url)
        }
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
