//
//  ProductViewModel.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 14/02/23.
//


import Foundation

protocol ProductApiDelegate {
    func getAllProduct(productResponse: [Product]? ) -> ()
}
protocol ProductApiErrorDelegate {
    func handleErrorFromProductApi(status:String,message:String)
}

struct ProductViewModel {
    var productDelegate: ProductApiDelegate?
    var productApiErrorDelegate: ProductApiErrorDelegate?
    let fetchProductApi: FetchProductApi?
    
    init(fetchProductApi: FetchProductApi?) {
        self.fetchProductApi = fetchProductApi
    }
    func fetchProduct() {
        fetchProductApi?.fetchProduct(completionHandler: { productResposne in
            if productResposne.products == nil {
                let status = productResposne.status!
                let message = productResposne.message!
                productApiErrorDelegate?.handleErrorFromProductApi(status: status, message: message)
            }
            else
            {
                var products: [Product] = []
                let dispatchGroup = DispatchGroup()
                dispatchGroup.enter()
                DispatchQueue.global().async {
                    productResposne.products!.forEach { product in
                        ProductRepositoryManager.instance.creatProduct(product: product)
                        products.append(product)
                    }
                    dispatchGroup.leave()
                }
                dispatchGroup.notify(queue: .main) {
                    productDelegate?.getAllProduct(productResponse: products)
                }
            }
        })
    }
}
