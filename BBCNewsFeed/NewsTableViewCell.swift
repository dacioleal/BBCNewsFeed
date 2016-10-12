//
//  NewsTableViewCell.swift
//  BBCNewsFeed
//
//  Created by Dacio Leal Rodriguez on 11/10/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var imgView : UIImageView
    let titleLabel : UILabel
    let dateLabel : UILabel
    let descriptionLabel : UILabel

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        imgView = UIImageView()
        imgView.contentMode = UIViewContentMode.scaleAspectFit
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        titleLabel.numberOfLines = 0
        dateLabel = UILabel()
        dateLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 14.0)
        descriptionLabel.numberOfLines = 0
        
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
        
        
        let constraintsH1 = NSLayoutConstraint.constraints(withVisualFormat: "|-10-[imgView(120)]-10-[dateLabel]-10-|", options: .directionLeadingToTrailing, metrics: nil, views: views)
        let constraintsH2 = NSLayoutConstraint.constraints(withVisualFormat: "|-10-[imgView(120)]-10-[titleLabel]-10-|", options: .directionLeadingToTrailing, metrics: nil, views: views)
        let constraintsH3 = NSLayoutConstraint.constraints(withVisualFormat: "|-10-[descriptionLabel]-10-|", options: .directionLeadingToTrailing, metrics: nil, views: views)
        let constraintsV1 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[imgView(80)]-5-[descriptionLabel]-5-|", options: .alignAllLeft, metrics: nil, views: views)
        let constraintsV2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[dateLabel(20)]-5-[titleLabel(60)]", options: .alignAllLeft, metrics: nil, views: views)

        self.contentView.addConstraints(constraintsH1)
        self.contentView.addConstraints(constraintsH2)
        self.contentView.addConstraints(constraintsH3)
        self.contentView.addConstraints(constraintsV1)
        self.contentView.addConstraints(constraintsV2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCellWithItem(_ item: NewsItem) {
        
        dateLabel.text = item.pubDate
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        
        let urlString = item.thumbnailAttr["url"]
        let imgURL = URL(string: urlString!)
        
        DispatchQueue.global().async {
            
            let imageData = try? Data(contentsOf: imgURL!)
            
            DispatchQueue.main.async {
                
                if let data = imageData {
                    self.imgView.image = UIImage(data: data)
                }
            }
        }
    }

}





















