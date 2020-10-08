//
//  AppFlowNavigation.swift
//  MovieAppStoryboard
//
//  Created by AKIS-iMac on 2020/10/07.
//

import Foundation
import UIKit

final class AppFlowNavigation {
    
    var navigationController: UINavigationController
//    private let appDIContainer: AppDIContainer
    
//    init(navigationController: UINavigationController,
//         appDIContainer: AppDIContainer) {
//        self.navigationController = navigationController
//        self.appDIContainer = appDIContainer
//    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        // Login Process
//        let moviesSceneDIContainer = appDIContainer.makeMoviesSceneDIContainer()
//        let flow = moviesSceneDIContainer.makeMoviesSearchFlowCoordinator(navigationController: navigationController)
//        flow.start()
    }
}
