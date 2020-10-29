//
//  ImageItemViewCell.swift
//  NoStoryBoardApp
//
//  Created by AKIS-iMac on 2020/10/29.
//

import UIKit

class ImageItemViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializedCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializedCell(){
        backgroundColor = UIColor.gray
        
        // MainImage
        let imageView = UIImageView()
        imageView.image = UIImage(named: "teble")
        imageView.backgroundColor = UIColor.blue
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo:topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6, constant: -10).isActive = true
        
        // Profile Image
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "snow")
        profileImageView.backgroundColor = UIColor.orange
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        // Profile Intro
        let profileIntroView = UILabel()
        profileIntroView.numberOfLines = 0
        profileIntroView.text = "Another way to put it; you can’t attach your hand to someone else’s hand unless they are in the room with you. The room being a UIView subview hierarchy, and our hands being either a top, bottom, leading, or trailing NSLayoutConstraint."
        profileIntroView.backgroundColor = UIColor.green
        addSubview(profileIntroView)
        profileIntroView.translatesAutoresizingMaskIntoConstraints = false
        profileIntroView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        profileIntroView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
        profileIntroView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        profileIntroView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
    }
}
