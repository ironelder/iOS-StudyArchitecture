//
//  MainViewController.swift
//  OpenWeatherApp
//
//  Created by AKIS-iMac on 2020/12/14.
//

import UIKit
import CoreLocation
import Alamofire

class MainViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    private let apikey = "c88eb92a38e25476371cc3c795b57ada"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializedLocation()
    }
    
    private func initializedLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        if locationManager.authorizationStatus == .authorizedWhenInUse || locationManager.authorizationStatus == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    private func getWeatherData(_ lat:CLLocationDegrees, _ lon:CLLocationDegrees) {
        let headers: HTTPHeaders = [
//            "Authorization": "Basic VXNlcm5hbWU6UGFzc3dvcmQ=",
            "Accept": "application/json"
        ]
        AF.request("https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apikey)", headers: headers).responseJSON { response in
            switch response.result {
                case.success(let result):
                    print("result = \(result)")
                case.failure(let error):
                    print("error = \(error.localizedDescription)")
            }
        }
    }
}



extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0] as CLLocation
        print("locationManager latitude = \(String(describing: location.coordinate.latitude))")
        print("locationManager longitude = \(String(describing: location.coordinate.longitude))")
        getWeatherData(location.coordinate.latitude, location.coordinate.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error \(error.localizedDescription)")
    }
}
