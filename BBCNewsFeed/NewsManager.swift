//
//  NewsManager.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 10/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class NewsManager : NSObject, UITableViewDataSource  {
    
    static let sharedManager = NewsManager()
    
    let operationQueue = OperationQueue()
    
    var items = [NewsItem]()
    

    func addItem(_ item:NewsItem) {
        items.append(item)
    }
    
    
//MARK: TableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        let item = items[indexPath.row]
        cell.configCellWithItem(item)
        
        return cell
    }
    
}
