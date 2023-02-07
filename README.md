# APIManagerAsyncAwait. A simple API manager written with ASYNC AWAIT.

## HOW TO USE:
 simply drag and drop Manager folder inside your app, Thats it. 
 Example: From your view controller (OR a place where services can be called), call service as below 
 
 ```
 func callService(_ sender: Any) {
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
 ```
 
 ## Enable/Disable Error logs in Release mode
 There is Struct named as 'AppUtil' which can be used to hide/show logs in Release/Debug mode. 
 To enable this feature
   Open your Xcode settings and search for 'Other Swift flag'
   Under debug add a key  a *-D DEBUG* entry as image below 

<img width="728" alt="Screenshot 2023-02-07 at 16 32 41" src="https://user-images.githubusercontent.com/2304583/217289974-23d1dd9a-cb45-4e1d-81fa-8012d5b12826.png">
