//
//  NewsManager.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 10/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import Foundation

class NewsManager : NSObject, ItemParserDelegate {
    
    static let sharedManager = NewsManager()
    
    let operationQueue = OperationQueue()
    
    var items = [NewsItem]()
    
    func didParseItem(_ item: NewsItem) {
        items.append(item)
        print("\n\n \(item)")
    }
}
