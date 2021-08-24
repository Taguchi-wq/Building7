//
//  Location.swift
//  Building7
//
//  Created by cmStudent on 2021/08/25.
//

import Foundation
import CoreLocation

class Location: NSObject {
    
    // MARK: - Private Properties
    /// location
    private var location: CLLocationManager!
    
    
    // MARK: - Properties
    /// 緯度
    var latitude: Double?
    /// 経度
    var longitude: Double?
    
    
    // MRAK: - Initializer
    override init() {
        super.init()
        
        setupLocation()
    }
    
    
    // MARK: - Private Funcs
    /// locationの設定をする
    private func setupLocation() {
        location = CLLocationManager()
        location.delegate = self
        checkLocationAuthorization()
    }
    
    /// 位置情報の認証状態を確認する
    private func checkLocationAuthorization() {
        switch location.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            location.startUpdatingLocation()
        case .denied, .notDetermined, .restricted:
            location.requestWhenInUseAuthorization()
        @unknown default:
            fatalError()
        }
    }
    
}


// MARK: - CLLocationManagerDelegate
extension Location: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        self.latitude  = location?.coordinate.latitude
        self.longitude = location?.coordinate.longitude
    }
    
    /// 認証ステータスが変更されるタイミングで呼ばれる
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}

