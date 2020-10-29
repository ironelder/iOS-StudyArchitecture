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
    private let appContainer: AppContainerDI
    
    init(navigationController: UINavigationController,
         appContainer: AppContainerDI) {
        self.navigationController = navigationController
        self.appContainer = appContainer
    }

    func start() {
        NSLog("biologin Start")
        // Login Process
//        let moviesSceneDIContainer = appDIContainer.makeMoviesSceneDIContainer()
//        let flow = moviesSceneDIContainer.makeMoviesSearchFlowCoordinator(navigationController: navigationController)
//        flow.start()
    }
}
