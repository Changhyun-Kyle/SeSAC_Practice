//
//  ViewController.swift
//  UIKit_CoreLocation
//
//  Created by 강창현 on 2/15/24.
//

import UIKit
import CoreLocation

final class ViewController: UIViewController {
    private let locationManager = CLLocationManager()
    private var appleHQLabel: UILabel {
        let label = UILabel()
        label.text = "애플 본사"
        return label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        // 권한 요청
        locationManager.requestWhenInUseAuthorization()
        
        // 현재 디바이스 권한(분기)
//        switch locationManager.authorizationStatus {
//        case .notDetermined:
//            return
//        case .restricted:
//            return
//        case .denied:
//            return
//        case .authorizedAlways:
//            return
//        case .authorizedWhenInUse:
//            return
//        case .authorized:
//            return
//        default:
//            break
//        }
        
        // 매우 정확한 위치 정보
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 덜 정확한 위치 정보
        locationManager.desiredAccuracy = kCLLocationAccuracyReduced
        
        getCoordinate(addressString: "1 Infinite Loop, Cupertino, CA") { placemarks,_ in
            print(placemarks.latitude, placemarks.longitude)
        }
        
        getCoordinate(addressString: "78, Gosanja-ro 32-gil, Dongdaemun-gu, Seoul, Republic of Korea") { placemarks,_ in
            print(placemarks.latitude, placemarks.longitude)
        }
    }
    
    func getCoordinate( addressString : String,
            completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                        
                    completionHandler(location.coordinate, nil)
                    return
                }
            }
                
            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        // 위치를 받아서 필요한 코드 작성
        let newLocation = locations.last
        print(newLocation)
    }
}
