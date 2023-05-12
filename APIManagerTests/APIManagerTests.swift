//
//  APIManagerTests.swift
//  APIManagerTests
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import XCTest
@testable import APIManager

final class APIManagerTests: XCTestCase {

    private var viewModel: RootViewModel!
    private var apiService: APIServiceProtocol!
    override func setUp() {
        apiService = MockAPIService()
        viewModel = RootViewModel(service: MockAPIService())
    }

    override func tearDown() {
        apiService = nil
        viewModel = nil
    }

    /**
      Test product return from async-await
      Only test for success. Add your own negative tests
     */
    func testViewModel_WhenAPIAvailable_ShouldReturnProduct() async throws {
    let product = try await viewModel.getProductList()
      XCTAssertNotNil(product)
    }
    
    
    /**
        Test product return from Task value.
        Only test for success. Add your own negative tests
     */
    func testTaskInViewModel_WhenAPIAvailable_ShouldReturnProductFromTaskValue() async throws {
      let task = viewModel.fetchProductTask()
      let product = try await task.value
      XCTAssertNotNil(product)
    }
}
