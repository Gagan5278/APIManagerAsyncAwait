//
//  ViewController.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import UIKit

class RootViewController: UIViewController {
    private let viewModel = RootViewModel(service: APIService())
    
    // MARK: - View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Call dummy service for exaple test
    @IBAction func callService(_ sender: Any) {
        Task { @MainActor in
          let product =  try await viewModel.getProductList()
            print(product)
        }
        
        /*
         Task { @MainActor in
         let task =  fetchProductModel()
         let result =  await task.result
         switch result {
         case .success(let product):
         print(product)
         case .failure(let error):
         print(error)
         }
         
         }
         */
    }
    
    /*
    func fetchProductModel() -> Task<Product?, Error> {
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
     */
}
