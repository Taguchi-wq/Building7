//
//  NetworkManager.swift
//  Building7
//
//  Created by cmStudent on 2021/08/15.
//

import Foundation

class NetworkManager {
    
    // MARK: - Static Properties
    /// NetworkManagerのshared
    static let shared = NetworkManager()
    
    
    // MARK: - Initializer
    private init() {}
    
    
    // MARK: - Private Funcs
    /// APIから情報を読み込む
    private func load<T: Decodable>(_ url: URL, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let typeObjects = try JSONDecoder().decode(T.self, from: data)
                completion(.success(typeObjects))
            } catch {
                completion(.failure(.invalidData))
            }
            
        }.resume()
    }
    
    /// APIから情報を配列で読み込む
    private func loadArray<T: Decodable>(_ url: URL, type: T.Type, completion: @escaping (Result<[T], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let typeObjects = try JSONDecoder().decode([T].self, from: data)
                completion(.success(typeObjects))
            } catch {
                completion(.failure(.invalidData))
            }
            
        }.resume()
    }
    
    
    // MARK: - Funs
    /// 天気の情報を読み込む
    func loadWeather(latitude: Double, longitude: Double, completion: @escaping (Result<Weather, NetworkError>) -> Void) {
        let url: URL = .weatherURL(latitude: latitude, longitude: longitude)
        load(url, type: Weather.self) { result in
            completion(result)
        }
    }
    
    /// ログインパスワードを読み込む
    func loadPassword(completion: @escaping (Result<[Password], NetworkError>) -> Void) {
        loadArray(.passwordURL, type: Password.self) { result in
            DispatchQueue.main.async { completion(result) }
        }
    }
    
    /// 7号館のフロア情報を読み込む
    func loadFloors(completion: @escaping (Result<[Floor], NetworkError>) -> Void) {
        loadArray(.floorURL, type: Floor.self) { result in
            DispatchQueue.main.async { completion(result) }
        }
    }
    
}
