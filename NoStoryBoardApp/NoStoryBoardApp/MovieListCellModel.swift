//
//  MovieListCellModel.swift
//  NoStoryBoardApp
//
//  Created by AKIS-iMac on 2020/11/09.
//

import UIKit

struct MovieListCellModel:Decodable {
    let id: Int
    let poster_path: String?
    let overview: String
    let original_title: String
    let title: String
    let release_date: String
}
