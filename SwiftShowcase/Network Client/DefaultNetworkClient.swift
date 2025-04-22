//
//  DefaultNetworkService.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

struct DefaultNetworkClient: NetworkClient {
    
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func request<T: Decodable>(at endPoint: EndPoint) async throws -> T {
        
        guard let url = buildURL(from: endPoint) else {
            throw NetworkError.invalidEndPoint(endPoint)
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw NetworkError.invalidStatusCode(-1)
        }
        
        guard (200...299).contains(statusCode) else {
            throw NetworkError.invalidStatusCode(statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    private func buildURL(from endPoint: EndPoint) -> URL? {
        var urlComponent = URLComponents()
        urlComponent.scheme = endPoint.scheme
        urlComponent.host = endPoint.host
        urlComponent.path = endPoint.path
        urlComponent.queryItems = endPoint.queryItems
        guard let url = urlComponent.url else { return nil }
        return url
    }
}
