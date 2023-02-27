//
//  FetchProductApi.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 14/02/23.
//

import Foundation

struct FetchProductApi {
    private let apiUrl: URL
    
    init(apiUrl: URL = URL(string: "https://dummyjson.com/products")! ) {
        self.apiUrl = apiUrl
    }
    func fetchProduct(completionHandler: @escaping (ProductApiResposne) -> (Void) ) {
        let task = URLSession.shared.dataTask(with: apiUrl) { data, urlResponse, error in
            guard error == nil else {
                let apiResposne = ProductApiResposne(products: nil, status: "404", message: "Page not found")
                completionHandler(apiResposne)
                return
            }
            do {
                let data = try JSONDecoder().decode(ProductApiResposne.self, from: data!)
                completionHandler(data)
            }
            catch let err {
                let apiResposne = ProductApiResposne(products: nil, status: "404", message: "Page not found")
                completionHandler(apiResposne)
                print("Error is \(err.localizedDescription)")
            }
        }
        task.resume()
    }
}
