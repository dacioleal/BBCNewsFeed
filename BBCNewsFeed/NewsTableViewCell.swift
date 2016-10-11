//
//  NewsTableViewCell.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 11/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let imgView : UIImageView
    let titleLabel : UILabel
    let dateLabel : UILabel
    let descriptionLabel : UILabel

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        imgView = UIImageView()
        titleLabel = UILabel()
        dateLabel = UILabel()
        descriptionLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(descriptionLabel)
        
        //Autolayout
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let views : [String : UIView] = ["imgView":imgView, "titleLabel":titleLabel, "dateLabel":dateLabel, "descriptionLabel":descriptionLabel]
        
        

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
