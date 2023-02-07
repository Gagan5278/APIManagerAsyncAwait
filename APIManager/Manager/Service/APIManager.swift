//
//  APIManager.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import Foundation

final class APIManager {
    public internal(set) var sessoin: URLSession = .shared
    
    static let sharedAPIManager: APIManager = APIManager()
    
    // MARK: - init
    private init() { }
}

extension APIManager {
    func responseHeader<T: Codable>(
        _ dataWithRrsponse: ( data: Data, response: URLResponse)
    ) async throws -> T {
        guard let response = dataWithRrsponse.response as? HTTPURLResponse else {
            throw APIManagerError.conversionFailedToHTTPURLResponse
        }
        
        try response.statusCodeChecker()
        return try JSONDecoder().decode(
            T.self,
            from: dataWithRrsponse.data
        )
    }
}

extension APIManager: Managable {
    func request<T>(
        url: URL,
        httpMethod: HTTPServiceMethod,
        body: Data?,
        headers: [String: String]?,
        expectingReturnType: T.Type
    ) async throws -> T where T: Codable {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        if let body = body, httpMethod != .get {
            request.httpBody =  body
        }
        request.addHeader(from: headers)
        return try await self.responseHeader(
            sessoin.data(for: request)
        )
    }
}
