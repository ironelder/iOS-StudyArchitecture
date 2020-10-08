//
//  AppDelegate.swift
//  MovieAppStoryboard
//
//  Created by AKIS-iMac on 2020/10/07.
//

import UIKit
import SwiftyBeaver

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let log = SwiftyBeaver.self
//    let appDIContainer = AppDIContainer()
    var appFlowNavigation: AppFlowNavigation?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppAppearance.setupAppearance()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()

        window?.rootViewController = navigationController
        appFlowNavigation = AppFlowNavigation(navigationController: navigationController) // ,appDIContainer: appDIContainer)
        appFlowNavigation?.start()
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        log.debug("applicationDidEnterBackground")
//        CoreDataStorage.shared.saveContext()
    }
    
}

