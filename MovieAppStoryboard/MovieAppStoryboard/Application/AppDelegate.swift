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
    let bioLogin = BioLoginLogic()
    let appContainer = AppContainerDI()
    var appFlowNavigation: AppFlowNavigation?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppAppearance.setupAppearance()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()

        window?.rootViewController = navigationController
        appFlowNavigation = AppFlowNavigation(navigationController: navigationController ,appContainer: appContainer)
        appFlowNavigation?.start()
        let bioType = bioLogin.canevaluateBiometrics()
        if(bioType != BiometicType.NONE || bioType != BiometicType.UNKNOWN){
            bioLogin.authContext
                .evaluatePolicy(
                    .deviceOwnerAuthentication,
                    localizedReason: bioType == BiometicType.FINGER ? "Touch ID를 사용합니다." : "Face ID를 사용합니다." ,
                    reply:
                    { success , error in
                        if success {
                            self.log.debug("Login Success")
                        } else {
                            self.log.debug("Login Failed")
                        }
                    })
        }
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        log.debug("applicationDidEnterBackground")
//        CoreDataStorage.shared.saveContext()
    }
    
}

