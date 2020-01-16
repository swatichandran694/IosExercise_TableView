//
//  DetailsTableViewCell.swift
//  IosAssignment
//
//  Created by Swati Chandran on 09/01/20.
//  Copyright © 2020 SwatiChandran. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {


    var details:Rows? {
        didSet {
            guard let detailItem = details else {return}
            if let name = detailItem.title {
                nameLabel.text = name
            }
            if let imageHref = detailItem.imageHref {
                detailsImageView.image = UIImage(named: "No_Image")
                detailsImageView.downloadImageFrom(urlString: imageHref, imageMode: .scaleAspectFit)
            }
            else{
                detailsImageView.image = UIImage(named: "No_Image")
            }
            detailedLabel.text = detailItem.description
        }
    }
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        //view.backgroundColor = .lightGray
        return view
    }()
    
    let detailsImageView:CustomImageView = {
        let img = CustomImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = img.frame.size.width / 2
        img.layer.shadowRadius = 5;
        img.layer.shadowOpacity = 0.5;
        img.clipsToBounds = true
        return img
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailedLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleToFill
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(detailsImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(detailedLabel)
        self.contentView.addSubview(containerView)
        
        detailsImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        detailsImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:5).isActive = true
        detailsImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        detailsImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        containerView.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.detailsImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-5).isActive = true
        //containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor, constant:10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant:5).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        detailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        detailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant:5).isActive = true
        detailedLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor, constant:-5).isActive = true
        detailedLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        detailedLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }

}
