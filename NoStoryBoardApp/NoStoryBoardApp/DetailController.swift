//
//  DetailController.swift
//  NoStoryBoardApp
//
//  Created by AKIS-iMac on 2020/11/09.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import SnapKit

class DetailController: UIViewController {
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let movieView = UIView()
    let moviePostImage = UIImageView()
    let titleLabel = UILabel()
    let overviewLabel = UILabel()
    var detailMovieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let detailId = detailMovieId {
            print("detail = \(detailId)")
            getMovieDetailData(movieId: String(detailId))
        }
        //https://image.tmdb.org/t/p/original/wwemzKWzjKYJFfCeiB57q3r4Bcm.png
        initializedLayout()
    }
    
    func initializedLayout(){
        view.addSubview(scrollView)
        view.backgroundColor = UIColor.gray
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        stackView.backgroundColor = UIColor.systemOrange
        stackView.axis = .vertical
        stackView.alignment = .fill // .Leading .FirstBaseline .Center .Trailing .LastBaseline
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        // using Snap Kit
        stackView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.width.equalTo(scrollView)
        }
        
        // using Normal
//        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
//        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        
        stackView.addArrangedSubview(movieView)
        movieView.backgroundColor = UIColor.lightGray
        movieView.translatesAutoresizingMaskIntoConstraints = false
        movieView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        moviePostImage.contentMode = .scaleAspectFit
        movieView.addSubview(moviePostImage)
        moviePostImage.translatesAutoresizingMaskIntoConstraints = false
        let moviePostMargin = UIScreen.main.bounds.width / 4
        moviePostImage.leadingAnchor.constraint(equalTo: movieView.leadingAnchor, constant: moviePostMargin).isActive = true
        moviePostImage.trailingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: -moviePostMargin).isActive = true
        moviePostImage.topAnchor.constraint(equalTo: movieView.topAnchor, constant: 0).isActive = true
        moviePostImage.bottomAnchor.constraint(equalTo: movieView.bottomAnchor, constant: 0).isActive = true
        
        
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        stackView.addArrangedSubview(titleLabel)
        
        overviewLabel.numberOfLines = 0
        overviewLabel.lineBreakMode = .byWordWrapping
        overviewLabel.backgroundColor = UIColor.gray
        stackView.addArrangedSubview(overviewLabel)
    }
    
    func setDetailData(_ dataModel: MovieDetailModel){
        if let posterPath = dataModel.poster_path {
            let url = URL(string: "https://image.tmdb.org/t/p/original\(String(posterPath))")
            moviePostImage.kf.setImage(with: url)
        } else {
            moviePostImage.image = UIImage(named: "snow")
        }
        titleLabel.text = dataModel.title
        overviewLabel.text = dataModel.overview
        
    }
    
    fileprivate func getMovieDetailData(movieId:String){
        //apikey = e17c2715face752d9ed1a2a0054aa7d6
        //exam : https://api.themoviedb.org/3/movie/550?api_key=e17c2715face752d9ed1a2a0054aa7d6
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        let apiKey = "e17c2715face752d9ed1a2a0054aa7d6"
        AF.request("https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(apiKey)", headers: headers).responseJSON { response in
            debugPrint(response)
            switch response.result {
            case.success(let value):
                let json = JSON(value)
                print("json = \(json)")
                do{
                    let movieDetailModel = try JSONDecoder().decode(MovieDetailModel.self, from: json.rawData())
                    self.setDetailData(movieDetailModel)
                } catch {
                    print("error = \(error)")
                }
            default:
                return
            }
        }
    }
}
