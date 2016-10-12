//
//  NewsManager.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 10/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class NewsManager : NSObject, ItemParserDelegate, UITableViewDelegate, UITableViewDataSource  {
    
    static let sharedManager = NewsManager()
    
    let operationQueue = OperationQueue()
    
    var items = [NewsItem]()
    


//MARK: ItemsParserDelegate methods

    func didParseItem(_ item: NewsItem) {
        items.append(item)
        print("\n\n \(item)")
    }
    
    func didFinishParse() {
        print("Finished")
    }
    
//MARK: TableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        let item = items[indexPath.row]
        //        let item = NewsItem(title: "Title", pubDate: "22/10/2016", description: "Description goes here and dhsjadhsakjhdsjdhsajkhdsajkhdkasjhdaksjhdjsahdkjsahdkjhsakjdhkjsahdksahdkjsah", thumbnailAttr: ["hello":"world"], link: "http://")
        cell.configCellWithItem(item)
        
        return cell
    }
}
