//
//  ImageItemViewCell.swift
//  NoStoryBoardApp
//
//  Created by AKIS-iMac on 2020/10/29.
//

import UIKit
import Kingfisher

class ImageItemViewCell: UICollectionViewCell {
    let baseImageUrl = ""
    let imageView = UIImageView()
    let profileImageView = UIImageView()
    let profileTitleView = UILabel()
    let profileOverView = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializedCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializedCell(){
        backgroundColor = UIColor.lightGray
        
        // Profile Image
        profileImageView.image = UIImage(named: "snow")
        profileImageView.backgroundColor = UIColor.orange
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo:topAnchor, constant: 10).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        // Profile Intro
        profileTitleView.numberOfLines = 1
        profileTitleView.text = "Title"
        profileTitleView.backgroundColor = UIColor.green
        addSubview(profileTitleView)
        profileTitleView.translatesAutoresizingMaskIntoConstraints = false
        profileTitleView.topAnchor.constraint(equalTo:topAnchor, constant: 10).isActive = true
        profileTitleView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
        profileTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        profileTitleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
//        profileIntroView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        profileOverView.numberOfLines = 0
        profileOverView.text = "OverView"
        profileOverView.backgroundColor = UIColor.systemOrange
        addSubview(profileOverView)
        profileOverView.translatesAutoresizingMaskIntoConstraints = false
        profileOverView.topAnchor.constraint(equalTo: profileTitleView.bottomAnchor, constant: 5).isActive = true
        profileOverView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
        profileOverView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        profileOverView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
    }
    
    
    func setMovieData(_ data: MovieListCellModel) {
        if let posterPath = data.poster_path {
            let url = URL(string: "https://image.tmdb.org/t/p/original\(String(posterPath))")
            profileImageView.kf.setImage(with: url)
        }
        profileTitleView.text = data.title
        profileOverView.text = data.overview
    }
    
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor.gray : UIColor.lightGray
        }
    }
}
