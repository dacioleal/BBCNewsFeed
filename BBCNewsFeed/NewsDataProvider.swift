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
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
}
