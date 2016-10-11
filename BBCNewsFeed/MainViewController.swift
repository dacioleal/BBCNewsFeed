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
        backView.backgroundColor = UIColor.red
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor.yellow
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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
