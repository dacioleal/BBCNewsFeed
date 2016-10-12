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
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.register(NewsTableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "NewsCell")
        tableView.dataSource = newsManager
        tableView.delegate = self
        self.tableView.tableHeaderView = NewsTableHeaderView(frame: CGRect(origin: CGPoint.init(x: 0, y: 0), size: CGSize(width: tableView.frame.width, height: 50.0)))
        
        let operation = NewsDownloadOperation()
        operation.itemParserDelegate = newsManager
        newsManager.operationQueue.addOperation(operation)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.reload), name: Notification.Name(rawValue: "finishedNewsDownloading"), object: nil)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "finishedNewsDownloading"), object: nil)
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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

}
