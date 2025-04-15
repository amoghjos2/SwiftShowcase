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
    
        guard let url = buildURL(from: endPoint) else {
            throw NetworkError.invalidEndPoint(endPoint)
        }

        var data: Foundation.Data, response: Foundation.URLResponse
        
        do {
            (data, response) = try await session.data(from: url)
            
        } catch let error as URLError {
            throw .urlError(error)
            
        } catch {
            throw .otherError(error)
        }
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw NetworkError.invalidStatusCode(-1)
        }
        
        guard (200...299).contains(statusCode) else {
            throw NetworkError.invalidStatusCode(statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
            
        } catch let error as DecodingError {
            throw .failedDecoding(error)
        } catch {
            throw .otherError(error)
        }
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
