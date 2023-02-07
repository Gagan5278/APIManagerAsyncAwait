//
//  Dictionary+Extension.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import Foundation

extension Dictionary {
    func serialize() throws -> Data {
        try JSONSerialization.data(
            withJSONObject: self,
            options: .prettyPrinted
        )
    }
}
