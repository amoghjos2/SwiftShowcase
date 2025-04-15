//
//  DefaultNetworkService.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

struct DefaultNetworkService: NetworkService {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(at endPoint: EndPoint) async throws(NetworkError) -> T {
        do {
            let url = try buildURL(from: endPoint)
            let (data, response) = try await session.data(from: url)
            return try JSONDecoder().decode(T.self, from: data)
            
        } catch let error as NetworkError {
            throw error
        } catch {
            throw .failedDecoding
        }
    }
    
    private func buildURL(from endPoint: EndPoint) throws(NetworkError) -> URL {
        var urlComponent = URLComponents()
        urlComponent.scheme = endPoint.scheme
        urlComponent.host = endPoint.host
        urlComponent.path = endPoint.path
        urlComponent.queryItems = endPoint.queryItems
        guard let url = urlComponent.url else { throw .invalidEndPoint }
        return url
    }
}
