//
//  DetailViewController.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 12/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {
    
    var webView: UIWebView = UIWebView()
    var activityIndicator: UIActivityIndicatorView!
    
    override func loadView() {
        
        let backView = UIView()
        backView.backgroundColor = UIColor.white
        
        webView.sizeToFit()
        webView.delegate = self
        backView.addSubview(webView)
        
        //Autolayout for views
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        //Webview
        let views: [String : UIView] = ["webView" : webView]
        let constraintsH1 = NSLayoutConstraint.constraints(withVisualFormat: "|-10-[webView]-10-|", options: .directionLeadingToTrailing, metrics: nil, views: views)
        let constraintsV1 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[webView]-0-|", options: .alignAllLeft, metrics: nil, views: views)
        backView.addConstraints(constraintsH1)
        backView.addConstraints(constraintsV1)
        
//        let constraintsH2 = NSLayoutConstraint.constraints(withVisualFormat: "|-[activityIndicator]-|", options: .directionLeadingToTrailing, metrics: nil, views: views)
//        let constraintsV2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[activityIndicator]-|", options: .alignAllLeft, metrics: nil, views: views)
//        backView.addConstraints(constraintsH2)
//        backView.addConstraints(constraintsV2)
        
        
        
//        //ActivityIndicator
//        let constraintH2 = NSLayoutConstraint(item: activityIndicator, attribute: .centerX, relatedBy: .equal, toItem: backView, attribute: .centerX, multiplier: 1.0, constant: 0)
//        let constraintV2 = NSLayoutConstraint(item: activityIndicator, attribute: .centerY, relatedBy: .equal, toItem: backView, attribute: .centerY, multiplier: 1.0, constant: 0)
//        backView.addConstraint(constraintH2)
//        backView.addConstraint(constraintV2)
        
        self.view = backView
        
//        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
//        activityIndicator.backgroundColor = UIColor.red
//        activityIndicator.center = self.view.center
//        activityIndicator.hidesWhenStopped = true
//        self.view.addSubview(activityIndicator)
//        activityIndicator.startAnimating()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadWebPageWithUrl(_ url: URL) {
        
        let request = URLRequest(url: url)
        self.webView.loadRequest(request)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        //activityIndicator.stopAnimating()
    }
}
