//
//  Building.swift
//  Building7
//
//  Created by cmStudent on 2021/08/18.
//

import Foundation

class Building {
    
    // MARK: - Private Properties
    /// ロケーション
    private let location: Location!
    /// 高度計
    private var altimeter: Altimeter!
    
    
    // MARK: - Initializer
    init() {
        location  = Location()
        altimeter = Altimeter()
    }
    
    
    // MARK: - Private Funcs
    /// 高度を取得する
    /// - Parameter completion: 高度
    private func getAlttitude(completion: @escaping (Double) -> Void) {
        guard let latitude  = location.latitude,
              let longitude = location.longitude else { return }
        guard let weather = loadWather(latitude: latitude, longitude: longitude) else { return }
        altimeter.getPressure { pressure in
            let temp1 = pow(weather.current.seaLevelPressure / pressure, (1 / 5.257)) - 1
            let temp2 = weather.current.temp + 273.15
            let temp3 = temp1 * temp2
            let alttitude = temp3 / 0.0065
            completion(alttitude)
        }
    }
    
    
    // MARK: - Funcs
    /// 現在の階数を取得する
    /// - Parameter completion: 現在の階数
    func getCurrentFloor(completion: @escaping (Int) -> Void) {
        getAlttitude { alttitude in
            let currentFloor = Int(round((alttitude - 33.8) / 3.3))
            completion(currentFloor)
        }
    }
    
}


// MARK: - API通信
extension Building {
    
    /// 現在地の天気を取得する
    /// - Parameters:
    ///   - latitude: 現在地の緯度
    ///   - longitude: 現在地の経度
    private func loadWather(latitude: Double, longitude: Double) -> Weather? {
        var currentWeather: Weather?
        
        let semaphore = DispatchSemaphore(value: 0)
        NetworkManager.shared.loadWeather(latitude: latitude,
                                          longitude: longitude) { result in
            switch result {
            case .success(let weather):
                currentWeather = weather
                semaphore.signal()
            case .failure(let error):
                print(error)
                semaphore.signal()
            }
        }
        
        semaphore.wait()
        
        return currentWeather
    }
    
}
