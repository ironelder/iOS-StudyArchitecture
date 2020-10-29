//
//  ViewController.swift
//  NoStoryBoardApp
//
//  Created by AKIS-iMac on 2020/10/15.
//

import UIKit

class HomeController: UIViewController {

    var collectionView: UICollectionView?
    let items = ["teble", "darkflower", "etc", "heart", "snow"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        view?.backgroundColor = UIColor.white
        collectionViewInitialized()
    }
    
    fileprivate func collectionViewInitialized(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.contentInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        view.addSubview(collectionView ?? UICollectionView(frame: .zero, collectionViewLayout: layout))
        
        collectionView?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CELL")
        collectionView?.register(ImageItemViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }

}

extension HomeController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count * 5
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)
//        let imageView = UIImageView(image: UIImage(named: items[indexPath.row]))
//        cell.addSubview(imageView)
//        cell.clipsToBounds = true
//        imageView.contentMode = .scaleToFill
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
//        imageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
//        imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0).isActive = true
//        return cell
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
        return cell
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.9, height: collectionView.frame.height * 0.3)
    }
}

