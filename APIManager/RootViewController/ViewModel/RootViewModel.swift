//
//  RootViewModel.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/05/12.
//

import Foundation

class RootViewModel {
    
    private let service: APIServiceProtocol

    // MARK: - init
    init(service: APIServiceProtocol) {
        self.service = service
    }
    
    func getProductList() async throws -> Product? {
        let task =  fetchProductTask()
        let result =  await task.result
        switch result {
        case .success(let product):
           return product
        case .failure(let error):
            print(error)
            return nil
        }
    }
    
    func fetchProductTask() -> Task<Product?, Error> {
        return Task {
            /*
            service.headers = // some header to be passed here if required
            service.bodyParameters = // request body to be passed here if required
            */
            return try? await service.callService(
                with: "https://dummyjson.com/products/1",
                model: Product.self,
                serviceMethod: .get
            )
        }
    }
}
