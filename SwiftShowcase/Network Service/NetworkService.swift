//
//  NetworkService.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/14/25.
//

import Foundation

protocol NetworkService {
    func request<T: Decodable>(at endPoint: EndPoint) async throws -> T
}

protocol EndPoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

enum NetworkError: Error {
    case invalidEndPoint
    case networkError(String)
    case invalidReponseCode
    case invalidData
    case failedDecoding
}

//struct DefaultNetworkService: NetworkService {
//    func request<T: Decodable>(at endPoint: EndPoint) async throws -> T {
//        
//        return
//    }
//    
//    private func buildURL(from endPoint: EndPoint) -> URL? {
//        var urlComponent = URLComponents()
//        urlComponent.scheme = endPoint.scheme
//        urlComponent.host = endPoint.host
//        urlComponent.path = endPoint.path
//        urlComponent.queryItems = endPoint.queryItems
//        guard let url = urlComponent.url else { return nil }
//        return url
//    }
//}

