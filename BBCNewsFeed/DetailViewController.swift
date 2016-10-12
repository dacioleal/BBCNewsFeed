//
//  DetailViewController.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 12/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var webView: UIWebView = UIWebView()
    
    override func loadView() {
        
        let backView = UIView()
        
        webView.sizeToFit()
        backView.addSubview(webView)
        
        //Autolayout
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        let views: [String : UIView] = ["webView" : webView]
        
        let constraintsH = NSLayoutConstraint.constraints(withVisualFormat: "|-0-[webView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: views)
        let constraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[webView]-0-|", options: .alignAllLeft, metrics: nil, views: views)
        backView.addConstraints(constraintsH)
        backView.addConstraints(constraintsV)
        
        self.view = backView
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    func loadWebPageWithUrl(_ url: URL) {
        
        let request = URLRequest(url: url)
        self.webView.loadRequest(request)
    }
}
