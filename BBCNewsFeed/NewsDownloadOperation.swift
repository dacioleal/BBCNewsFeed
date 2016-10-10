//
//  NewsDownloadOperation.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 10/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class NewsDownloadOperation: Operation, XMLParserDelegate {
    
    var elementValue: String?
    var success = false
    
    override func main() {
        
        let urlPathString = "http://feeds.bbci.co.uk/news/world/rss.xml"
        let url = URL(string: urlPathString)
        
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
        
        if didStartElement == "success" {
            elementValue = String()
        }
        print(didStartElement)
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if elementValue != nil {
            elementValue! += string
        }
        print(string)
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "success" {
            if elementValue == "true" {
                success = true
            }
            elementValue = nil
        }
        print(elementName)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("Parse error occurred: \(parseError)")
    }
}
