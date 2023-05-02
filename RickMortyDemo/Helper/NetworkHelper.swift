//
//  NetworkHelper.swift
//  RickMortyDemo
//
//  Created by Saumya Macwan on 02/05/23.
//

import Foundation

enum CharacterError : Error {
    case badURL
    case invalidData
    case badResponse
    case networkError(Error?)
}

typealias Handler = (Result<Character, CharacterError>) -> Void

final class NetworkHelper {
    static let shared = NetworkHelper()
    
    private init(){}
    
    func fetchCharacterDetails(handler: @escaping Handler) {
        guard let url = URL(string: "\(Constants.API.baseUrl)\(Constants.API.characters)") else {
            handler(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            guard let data else {
                handler(.failure(.invalidData))
                return
            }
            
            guard let response  = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                handler(.failure(.badResponse))
                return
            }
            
            do {
                let characters  = try JSONDecoder().decode(Character.self, from: data)
                handler(.success(characters))
            } catch {
                handler(.failure(.networkError(error)))
            }
        }).resume()
    }
}
