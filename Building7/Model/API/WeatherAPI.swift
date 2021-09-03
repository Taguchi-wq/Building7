//
//  WeatherAPI.swift
//  Building7
//
//  Created by cmStudent on 2021/09/03.
//

import Foundation

final class WeatherAPI {
    
    /// 天気を取得するURLRequest
    struct WeatherRequest: Request {
        
        // MARK: - Private Properties
        /// 緯度
        let latitude: Double
        /// 経度
        let longitude: Double
        
        
        // MARK: - Properties
        /// URLのベース
        var baseURL: URL {
            return URL(string: PListManager.getWeathersValue("BaseURL"))!
        }
        
        /// URLのパス
        var path: String {
            return PListManager.getWeathersValue("Path")
        }
        
        /// URLのクエリ
        var queryItems: [URLQueryItem] {
            return [
                URLQueryItem(name: "units", value: PListManager.getWeathersValue("Units")),
                URLQueryItem(name: "lat", value: String(latitude)),
                URLQueryItem(name: "lon", value: String(longitude)),
                URLQueryItem(name: "appid", value: PListManager.getWeathersValue("Key"))
            ]
        }
    }
    
}
