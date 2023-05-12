//
//  MockAPIService.swift
//  APIManagerTests
//
//  Created by Gagan Vishal  on 2023/05/12.
//
@testable import APIManager
import Foundation

class MockAPIService: APIServiceProtocol {
    var headers: [String : String]?
    
    var bodyParameters: [String : String]?
    
    func callService<T>(with urlString: String, model: T.Type, serviceMethod: HTTPServiceMethod) async throws -> T  {
        // TODO: - Replace with fancy dummy data model entity
        return Product(id: 1, title: "12", description: "12", price: 12, discountPercentage: 2.3, rating: 1.2, stock: 3, brand: "Hello", category: "Test", thumbnail: "some_image", images: ["some_image"]) as! T
    }

}
