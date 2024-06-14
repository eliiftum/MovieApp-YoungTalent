//
//  Movie.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 14.06.2024.
//

import Foundation
import Alamofire

enum MovieRequestEndpoint {
    case nowPlaying
    case movieDetail(id: Int)
    
    var endPoint: String {
        switch self {
        case .nowPlaying:
            return "/movie/now_playing"
        case .movieDetail(let id):
            return "/movie/\(id)"
        }
    }
    
}


class TMDbNetworkManager {
    static let shared = TMDbNetworkManager()
    private let apiKey = "34b334e3793ef420bcd6b6689535e162" // TMDb API anahtarınızı buraya ekleyin
    private let baseURL = "https://api.themoviedb.org/3"
    
    private init() {}
    
    func request<T: Decodable,P: Codable>(endpoint: String,
                                          method: HTTPMethod = .get,
                                          parameters: [String: Any]? = nil,
                                          body: P? = nil,
                                          completion: @escaping (Result<T, Error>) -> Void) {
        var urlComponents = URLComponents(string: baseURL + endpoint)!
        
        
        urlComponents.queryItems?.append(URLQueryItem(name: "api_key", value: "\(apiKey)"))

        
        if let parameters = parameters {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        guard  let url = urlComponents.url else {
            return
        }
        
        AF.request(url,
                   method: method,
                   parameters: body).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func request<T: Decodable>(endpoint: String,
                                          method: HTTPMethod = .get,
                                          parameters: [String: Any]? = nil,
                               completion: @escaping (Result<T, Error>) -> Void) {
        let urlValue = baseURL + endpoint + "?api_key=" + apiKey
        
        var urlComponents = URLComponents(string: urlValue)
        
        if let parameters = parameters {
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        
        guard  let url = urlComponents?.url else {
            return
        }
        
        AF.request(url,
                   method: method,
                   parameters: parameters).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
