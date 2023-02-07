//
//  Managable.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import Foundation

protocol Managable {
    func request<T: Codable>(
        url: URL,
        httpMethod: HTTPServiceMethod,
        body: Data?,
        headers: [String: String]?,
        expectingReturnType: T.Type
    ) async throws -> T
}
