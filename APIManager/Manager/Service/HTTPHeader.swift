//
//  HTTPHeader.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import Foundation

enum HTTPHeaders: String {
    case formURLEncoded = "application/x-www-form-urlencoded"
    case contentType = "Content-Type"
    case accept = "Accept"
    case applicationJSON = "application/json"
}

extension URLRequest {
    mutating func addHeader(from headers: [String: String]?) {
        guard let headers = headers, !headers.isEmpty else {
            defaultHeaders()
            return
        }
        
        for header in headers {
            self.addValue(
                header.value,
                forHTTPHeaderField: header.key
            )
        }
    }
    
    mutating func defaultHeaders() {
        self.addValue(
            HTTPHeaders.formURLEncoded.rawValue,
            forHTTPHeaderField: HTTPHeaders.contentType.rawValue
        )
        self.addValue(
            HTTPHeaders.applicationJSON.rawValue,
            forHTTPHeaderField: HTTPHeaders.accept.rawValue
        )
    }
}
