//
//  MovieDetailModel.swift
//  NoStoryBoardApp
//
//  Created by AKIS-iMac on 2020/11/10.
//

import UIKit

struct MovieDetailModel: Decodable {
    let adult: Bool
    let backdrop_path: String?
    let homepage: String?
    let id: Int
    let original_language: String
    let poster_path: String?
    let release_date: String
    let title: String
    let overview: String
    let production_companies: [ProductionModel]
}

struct ProductionModel: Decodable {
    let id: Int
    let logo_path:String?
    let name:String
    let origin_country:String
}
