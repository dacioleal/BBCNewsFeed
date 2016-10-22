//
//  NewsDownloadOperation.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 10/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class NewsDownloadOperation: Operation, XMLParserDelegate {
    
    var item: NewsItem?
    var element: String?
    var itemParserDelegate: ItemParserDelegate?
    
    override func main() {
        
        let urlPathString = "http://feeds.bbci.co.uk/news/world/rss.xml"
        let url = URL(string: urlPathString)
        self.name = "NewsDownloadOperation"
        
        if let url = url {
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let task:URLSessionDataTask = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print("Error: \(error.debugDescription)")
                    return
                }
                
                if let data = data {
                    
                    let parser = XMLParser(data: data)
                    parser.delegate = self
                    parser.parse()
                }
            })
            task.resume()
        }
    }
    
    
    
//MARK: ParserDelegate methods
    
    func parser(_ parser: XMLParser, didStartElement: String, namespaceURI: String?, qualifiedName: String?, attributes: [String : String] = [:]) {
        
        element = didStartElement
        
        if element == "item" {
            item = NewsItem()
        }
        
        if element == "media:thumbnail" {
            item?.thumbnailAttr = attributes
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        let trimmed = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if !trimmed.isEmpty {
            
            if element == "title" {
                item?.title = string
            } else if element == "pubDate" {
                item?.pubDate = string
            } else if element == "description" {
                item?.description = string
            } else if element == "link" {
                item?.link = string
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "item", let item = item {
            parsedItem(item)
            self.item = nil
        }
        element = nil
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("Parse error occurred: \(parseError)")
    }
    
    func parserDidStartDocument(_ parser: XMLParser) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        
        if let delegate = itemParserDelegate {
            delegate.didFinishParse()
            
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
  
    

//MARK: ItemParserDelegate method (for finished parsed items)
    
    func parsedItem(_ item: NewsItem) {
        
        if let delegate = itemParserDelegate {
            delegate.didParseItem(item)
        }
    }
}
