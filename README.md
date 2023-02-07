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
 
 There is Struct named as 'AppUtil' which can be used to hide/show logs in Release/Debug mode. 
 To enable this feature
   Open your Xcode settings and search for 'Other Swift flag'
   Under debug add a key  a *-D DEBUG* entry as image below 
