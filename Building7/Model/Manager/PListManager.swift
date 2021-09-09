//
//  PListManager.swift
//  Building7
//
//  Created by cmStudent on 2021/08/28.
//

import Foundation

/// plistの情報を管理する
class PListManager {
    
    // MARK: - Initializer
    // イニシャライザを他から実行されないようにする
    private init() {}
    
    
    // MARK: - Propertys
    /// Building7URL.plistファイルを1回だけ読み込む
    private static let building7URLProperties = loadingPropertiesFile(forResource: "Building7URL")
    /// WeatherURL.plistファイルを1回だけ読み込む
    private static let weatherURLProperties   = loadingPropertiesFile(forResource: "WeatherURL")
    
    
    // MARK: - Methods
    /// plistファイルを読み込む
    /// - Returns: keyがString、valueがAnyの辞書型
    private static func loadingPropertiesFile(forResource name: String) -> [String : Any] {
        guard let path       = Bundle.main.path(forResource: name, ofType: "plist") else { return [:] }
        guard let dictionary = NSDictionary(contentsOfFile: path) as? [String : Any] else { return [:] }
        return dictionary
    }
    
    /// Building7URL.plistファイルのValueをStringで得る
    /// - Parameter key: key名
    /// - Returns: keyに対応するvalue、keyに対応する値がない場合、Stringではない場合はnil
    static func getBuilding7Value(_ key: String) -> String {
        return building7URLProperties[key] as? String ?? ""
    }
    
    /// WeatherURL.plistファイルのValueをStringで得る
    /// - Parameter key: key名
    /// - Returns: keyに対応するvalue、keyに対応する値がない場合、Stringではない場合はnil
    static func getWeathersValue(_ key: String) -> String {
        return weatherURLProperties[key] as? String ?? ""
    }
    
}
