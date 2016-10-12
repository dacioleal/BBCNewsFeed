//
//  MainViewController.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 10/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, ItemParserDelegate {
    
    let newsManager = NewsManager.sharedManager
    var tableView : UITableView!
    var refreshControl : UIRefreshControl!
    
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
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.register(NewsTableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "NewsCell")
        tableView.dataSource = newsManager
        tableView.delegate = self
        
        let headerView = NewsTableHeaderView(frame: CGRect(origin: CGPoint.init(x: 0, y: 0), size: CGSize(width: tableView.frame.width, height: 50.0)))
        self.tableView.tableHeaderView = headerView
        
        setUpDownloadOperation()
        
        refreshControl = UIRefreshControl()
        //refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(MainViewController.refreshAction), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func setUpDownloadOperation() {
        
        let downloadOperation = NewsDownloadOperation()
        downloadOperation.itemParserDelegate = self
        newsManager.operationQueue.addOperation(downloadOperation)
    }
    
    func refreshAction() {
        
        setUpDownloadOperation()
    }
    
    
//MARK: TableView delegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = newsManager.items[indexPath.row]
        let detailVC = DetailViewController()
        let webURL = URL(string: item.link)
        
        if let url = webURL {
            detailVC.loadWebPageWithUrl(url)
        }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }


//MARK: ItemsParserDelegate methods
    
    func didParseItem(_ item: NewsItem) {
        newsManager.addItem(item)
    }
    
    func didFinishParse() {
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
}








