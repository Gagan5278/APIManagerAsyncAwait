//
//  APIService.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import Foundation

protocol APIServiceProtocol {
    var headers: [String: String]? {get set}
    var bodyParameters: [String: String]? {get set}
    func callService<T: Codable>(
        with urlString: String,
        model: T.Type,
        serviceMethod: HTTPServiceMethod
    ) async throws -> T
}

class APIService: APIServiceProtocol {
    var headers: [String: String]?
    var bodyParameters: [String: String]?
    let apiManager: APIManager
    // MARK: - init
    init() {
        apiManager = APIManager()
    }
    
    func callService<T: Codable>(
        with urlString: String,
        model: T.Type,
        serviceMethod: HTTPServiceMethod
    ) async throws -> T {
        guard let url = URL(string: urlString) else { throw APIManagerError.badURL }
        let body = try (bodyParameters ?? [:]).serialize()
        return try await apiManager.request(
            url: url,
            httpMethod: serviceMethod,
            body: body,
            headers: bodyParameters,
            expectingReturnType: T.self)
    }
}
