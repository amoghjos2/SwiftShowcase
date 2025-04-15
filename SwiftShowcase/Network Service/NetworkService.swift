//
//  NetworkService.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/14/25.
//

import Foundation

protocol NetworkService {
    func request<T: Decodable>(at endPoint: EndPoint) async throws(NetworkError) -> T
}

protocol EndPoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

enum NetworkError: Error {
    case invalidEndPoint(EndPoint)
    case urlError(URLError)
    case invalidStatusCode(Int)
    case failedDecoding(DecodingError)
    case otherError(Error)
}
