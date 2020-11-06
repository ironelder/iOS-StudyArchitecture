//
//  ViewController.swift
//  NoStoryBoardApp
//
//  Created by AKIS-iMac on 2020/10/15.
//

import UIKit
import Alamofire

class HomeController: UIViewController {

    var collectionView: UICollectionView?
    let items = ["teble", "darkflower", "etc", "heart", "snow"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: "#E23F61")
        view?.backgroundColor = UIColor.white
        getMovieData()
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
        
        collectionView?.register(ImageItemViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    fileprivate func getMovieData(){
        //apikey = e17c2715face752d9ed1a2a0054aa7d6
        //exam : https://api.themoviedb.org/3/movie/550?api_key=e17c2715face752d9ed1a2a0054aa7d6
        let headers: HTTPHeaders = [
            "Authorization": "Basic VXNlcm5hbWU6UGFzc3dvcmQ=",
            "Accept": "application/json"
        ]
        let apiKey = "e17c2715face752d9ed1a2a0054aa7d6"
        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)", headers: headers).responseJSON { response in
            debugPrint(response)
        }
    }

}

extension HomeController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count * 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? ImageItemViewCell else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
        }
        
        let model = TableDataModel(titleImageName: items.randomElement() ?? "etc", profileImageName: items.randomElement() ?? "etc", profileIntro: items.randomElement() ?? "etc")
        cell.setData(model)
        
        return cell
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.9, height: collectionView.frame.height * 0.3)
    }
}

