//
//  AppUtil.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import Foundation
struct AppUtil {
    static var isInDeveloperMode: Bool {
      #if DEBUG
        return false
      #else
        return false
      #endif
    }
}
