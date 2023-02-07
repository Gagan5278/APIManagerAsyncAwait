//
//  ViewController.swift
//  APIManager
//
//  Created by Gagan Vishal  on 2023/02/07.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: - View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Call dummy service for exaple test
    @IBAction func callService(_ sender: Any) {
        Task {
            do {
                let service = APIService<Product>()
                let product = try await service.callService(
                    with: "https://dummyjson.com/products/1",
                    serviceMethod: .get
                )
                print(product)
            } catch let error {
                print(error.description)
            }
        }
    }
}
