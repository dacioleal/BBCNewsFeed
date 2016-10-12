//
//  NewsTableHeaderView.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 12/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class NewsTableHeaderView: UIView {
    
    var imageView: UIImageView!
    var searchBar: UISearchBar!
    var searchButton: UIButton!

    override init(frame: CGRect) {
        
        imageView = UIImageView(image: UIImage(named: "BBC_logo_640x480"))
        imageView.contentMode = .scaleAspectFill
        searchBar = UISearchBar()
        searchBar.barTintColor = UIColor.lightGray
        searchBar.isUserInteractionEnabled = false;
        

        searchButton = UIButton()
        searchButton.setImage(UIImage(named: "Search_icon_50x50"), for: .normal)
        
        super.init(frame: frame)
        
        self.addSubview(imageView)
        self.addSubview(searchBar)
        self.addSubview(searchButton)
        
        //Autolayout
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        let views: [String : UIView] = ["imageView":imageView, "searchBar":searchBar, "searchButton":searchButton]
        
        let constraintsH1 = NSLayoutConstraint.constraints(withVisualFormat: "|-15-[imageView(40)]-10-[searchBar]-10-[searchButton(30)]-5-|", options: .directionLeadingToTrailing, metrics: nil, views: views)
        let constraintsV1 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[imageView(40)]", options: .alignAllLeft, metrics: nil, views: views)
        let constraintsV2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[searchBar(40)]", options: .alignAllLeft, metrics: nil, views: views)
        let constraintsV3 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[searchButton(30)]", options: .alignAllLeft, metrics: nil, views: views)
        
        self.addConstraints(constraintsH1)
        self.addConstraints(constraintsV1)
        self.addConstraints(constraintsV2)
        self.addConstraints(constraintsV3)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
