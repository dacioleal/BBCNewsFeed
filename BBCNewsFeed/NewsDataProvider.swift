//
//  NewsDataProvider.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 11/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class NewsDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let newsManager = NewsManager.sharedManager
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newsManager.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        let item = newsManager.items[indexPath.row]
//        let item = NewsItem(title: "Title", pubDate: "22/10/2016", description: "Description goes here and dhsjadhsakjhdsjdhsajkhdsajkhdkasjhdaksjhdjsahdkjsahdkjhsakjdhkjsahdksahdkjsah", thumbnailAttr: ["hello":"world"], link: "http://")
        cell.configCellWithItem(item)
        
        return cell
    }
    
    
    
}
