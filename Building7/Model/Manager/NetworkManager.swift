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
    private func load<T: Decodable>(_ url: URL, type: T.Type, completion: @escaping (Result<[T], Error>) -> Void) {
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
                print(error)
            }
            
        }.resume()
    }
    
    /// ログインパスワードを読み込む
    func loadPassword(completion: @escaping (Result<[Password], Error>) -> Void) {
        load(.passwordURL, type: Password.self) { result in
            switch result {
            case .success(let password):
                DispatchQueue.main.async { completion(.success(password)) }
            case .failure(let error):
                DispatchQueue.main.async { completion(.failure(error)) }
            }
        }
    }
    
    /// 7号館のフロア情報を読み込む
    func loadFloors(completion: @escaping (Result<[Floor], Error>) -> Void) {
        load(.floorURL, type: Floor.self) { result in
            switch result {
            case .success(let floors):
                DispatchQueue.main.async { completion(.success(floors)) }
            case .failure(let error):
                DispatchQueue.main.async { completion(.failure(error)) }
            }
        }
    }
    
}
