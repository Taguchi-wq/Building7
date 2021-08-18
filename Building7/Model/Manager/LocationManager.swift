//
//  LocationManager.swift
//  Building7
//
//  Created by cmStudent on 2021/08/18.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    // MARK: - Static Properties
    /// LocationManagerのshared
    static let shared = LocationManager()
    
    
    // MARK: - Private Properties
    /// locationManager
    private var locationManager: CLLocationManager!
    
    
    // MARK: - Properties
    /// 緯度
    var latitude: Double?
    /// 経度
    var longitude: Double?
    
    
    // MRAK: - Initializer
    override init() {
        super.init()
        
        setupLocationManager()
    }
    
    
    // MARK: - Private Funcs
    /// locationManagerの設定をする
    private func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        checkLocationAuthorization()
    }
    
    /// 位置情報の認証状態を確認する
    private func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .denied, .notDetermined, .restricted:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            fatalError()
        }
    }
    
}


// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    
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
