//
//  ItemParserDelegate.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 11/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import Foundation

protocol ItemParserDelegate {
    
    func didParseItem(_ item: NewsItem)
    
    func didFinishParse()
}
