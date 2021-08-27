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
    private func load<T: Decodable>(_ url: URL, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else { return }
            
            do {
                let typeObjects = try JSONDecoder().decode(T.self, from: data)
                completion(.success(typeObjects))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    /// APIから情報を配列で読み込む
    private func loadArray<T: Decodable>(_ url: URL, type: T.Type, completion: @escaping (Result<[T], Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else { return }
            
            do {
                let typeObjects = try JSONDecoder().decode([T].self, from: data)
                completion(.success(typeObjects))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    
    // MARK: - Funs
    /// 天気の情報を読み込む
    func loadWeather(latitude: Double, longitude: Double, completion: @escaping (Result<Weather, Error>) -> Void) {
        let url: URL = .weatherURL(latitude: latitude, longitude: longitude)
        load(url, type: Weather.self) { result in
            completion(result)
        }
    }
    
    /// ログインパスワードを読み込む
    func loadPassword(completion: @escaping (Result<[Password], Error>) -> Void) {
        loadArray(.passwordURL, type: Password.self) { result in
            DispatchQueue.main.async { completion(result) }
        }
    }
    
    /// 7号館のフロア情報を読み込む
    func loadFloors(completion: @escaping (Result<[Floor], Error>) -> Void) {
        loadArray(.floorURL, type: Floor.self) { result in
            DispatchQueue.main.async { completion(result) }
        }
    }
    
}
