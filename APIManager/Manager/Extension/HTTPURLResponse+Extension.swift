//
//  HTTPURLResponse+Extension.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import Foundation

extension HTTPURLResponse {
    func statusCodeChecker() throws {
        switch self.statusCode {
        case 200...299:
            return
        default:
            throw APIManagerError.urlError(statusCode: self.statusCode)
        }
    }
}
