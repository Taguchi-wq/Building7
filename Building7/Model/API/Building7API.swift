//
//  Building7API.swift
//  Building7
//
//  Created by cmStudent on 2021/09/03.
//

import Foundation

final class Building7API {
    
    /// 7号館の情報を取得するURLRequest
    struct FloorRequest: Request {
        
        // MARK: - Properties
        /// URLのベース
        var baseURL: URL {
            return URL(string: PListManager.getBuilding7Value("BaseURL"))!
        }
        
        /// URLのパス
        var path: String {
            return PListManager.getBuilding7Value("FloorPath")
        }
        
        /// URLのクエリ
        var queryItems: [URLQueryItem] {
            return [URLQueryItem(name: "key", value: PListManager.getBuilding7Value("Key"))]
        }
    }
    
    /// 7号館アプリにログインするためのパスワードの情報を取得するURLRequest
    struct PasswordRequest: Request {
        
        // MARK: - Properties
        /// URLのベース
        var baseURL: URL {
            return URL(string: PListManager.getBuilding7Value("BaseURL"))!
        }
        
        /// URLのパス
        var path: String {
            return PListManager.getBuilding7Value("PasswordPath")
        }
        
        /// URLのクエリ
        var queryItems: [URLQueryItem] {
            return [URLQueryItem(name: "key", value: PListManager.getBuilding7Value("Key"))]
        }
    }
    
}
