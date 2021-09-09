//
//  Request.swift
//  Building7
//
//  Created by cmStudent on 2021/08/28.
//

import Foundation

protocol Request {
    var baseURL: URL { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Request {
    
    /// URLRequestを作成する
    /// - Returns: URLRequest
    func createURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        
        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        
        return urlRequest
    }
    
}
