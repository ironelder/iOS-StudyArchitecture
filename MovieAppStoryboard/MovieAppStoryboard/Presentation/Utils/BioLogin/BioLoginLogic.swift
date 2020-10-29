//
//  BioLoginLogic.swift
//  MovieAppStoryboard
//
//  Created by AKIS-iMac on 2020/10/12.
//

import UIKit
import LocalAuthentication


class BioLoginLogic: NSObject {
        
    let authContext = LAContext()
    var authError: NSError?
        
    /// 현재 기기가 지원하는 생체인증 Type을 반환합니다.
    /// FACE: 얼굴인증, FINGER: 지문인증, NONE: 지원안함, UNKNOWN: 알 수 없음.
func canevaluateBiometrics() -> BiometicType {
        var result: BiometicType = .UNKNOWN
        if #available(iOS 8.0, *) {
            if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                if #available(iOS 11.0, *) {
                    
                    switch authContext.biometryType {
                        
                    case .faceID:
                        NSLog("Biometic... FACE ")
                        result = .FACE
                        
                        break
                        
                    case .touchID:
                        NSLog("Biometic... FINGER ")
                        result = .FINGER
                        break
                        
                    case .none:
                        result = .NONE
                        NSLog("Biometic... None ")
                        break
                    @unknown default:
                        result = .UNKNOWN
                        NSLog("Biometic... unknown")
                    }
                } else {
                    //11.0 이하, 8.0 이상
                    //지문인증: 5s ~ 8+, 8부터는 최소 버전이 8.0
                    //FACE ID: X부터, X의 최소 버전은 11.0.1
                    if UIDevice().userInterfaceIdiom == .phone {
                        switch UIScreen.main.nativeBounds.height {
                        case 1136:
                        NSLog("iPhone 5/5S/5C/SE")
                        result = .FINGER
                            break
                        case 1334:
                        NSLog("iPhone 6/6S/7/8")
                        result = .FINGER
                            break
                        case 2208:
                        NSLog("iPhone 6+/6S+/7+/8+")
                        result = .FINGER
                            break
                        default:
                        NSLog("unknown")
                        result = .UNKNOWN
                            break
                        }
                    }
                    
                }
                
            } else {
                // 기기에 지문등록 안 됨
                NSLog("Biometic... need Biometic.")
                if #available(iOS 11.0, *) {
                    
                    switch authContext.biometryType {
                        
                    case .faceID:
                        NSLog("Biometic... FACE ")
                        result = .FACE
                        break
                        
                    case .touchID:
                        NSLog("Biometic... FINGER ")
                        result = .FINGER
                        break
                        
                    case .none:
                        result = .NONE
                        NSLog("Biometic... None ")
                        break
                    @unknown default:
                        result = .UNKNOWN
                        NSLog("Biometic... unknown")
                    }
                } else {
                    //11.0 이하, 8.0 이상
                    //지문인증: 5s ~ 8+, 8부터는 최소 버전이 8.0
                    //FACE ID: X부터, X의 최소 버전은 11.0.1
                    if UIDevice().userInterfaceIdiom == .phone {
                        switch UIScreen.main.nativeBounds.height {
                        case 1136:
                        NSLog("iPhone 5/5S/5C/SE")
                        result = .FINGER
                            break
                        case 1334:
                        NSLog("iPhone 6/6S/7/8")
                        result = .FINGER
                            break
                        case 2208:
                        NSLog("iPhone 6+/6S+/7+/8+")
                        result = .FINGER
                            break
                        default:
                        NSLog("unknown")
                        result = .UNKNOWN
                            break
                        }
                    }
                    
                }
            }
        } else {
            //생체인증 지원 안 됨.
            result = .NONE
            NSLog("Biometic... not support.")
        }
        
        return result
    }
}
