//
//  APIManagerError.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import Foundation
enum APIManagerError: Error {
    case conversionFailedToHTTPURLResponse
    case serilizationFailed
    case urlError(statusCode: Int)
    case somethingWentWrong
    case badURL
}

extension APIManagerError {
    var showableError: Self {
        switch self {
        case .urlError(_):
            return self
        default:
            return .somethingWentWrong
        }
    }
    
    var showableErrorDescription: String {
        AppUtil.isInDeveloperMode ? self.errorDescription : self.showableError.localizedDescription
    }
    
   private var errorDescription: String {
        switch self {
        case .conversionFailedToHTTPURLResponse:
            return "Type casting failed"
        case .urlError(let code):
            return ErrorMessage.somethingWentWrong.rawValue + "Underlying status code: \(code)"
        case .somethingWentWrong:
            return ErrorMessage.somethingWentWrong.rawValue
        case .serilizationFailed:
            return "JSONSerialization failed"
        case .badURL:
            return "Malformed URL sent to session"
        }
    }
}
