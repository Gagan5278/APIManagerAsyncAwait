//
//  APIService.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import Foundation

class APIService<T: Codable> {
    var headers: [String: String]?
    var bodyParameters: [String: String]?
    
    func callService(
        with urlString: String,
        serviceMethod: HTTPServiceMethod
    ) async throws -> T {
        guard let url = URL(string: urlString) else { throw APIManagerError.badURL }
        let body = try (bodyParameters ?? [:]).serialize()
        let apiManager = APIManager()
        return try await apiManager.request(
            url: url,
            httpMethod: serviceMethod,
            body: body,
            headers: bodyParameters,
            expectingReturnType: T.self)
    }
}
