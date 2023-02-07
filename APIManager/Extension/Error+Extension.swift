//
//  Error+Extension.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import Foundation

extension Error {
    var description: String {
        ((self as? APIManagerError)?.showableErrorDescription) ?? self.localizedDescription
    }
}
