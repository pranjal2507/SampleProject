//
//  ProductRepositoryManager.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 14/02/23.
//


import Foundation

class ProductRepositoryManager {
    
    let productDataRepository = ProductDataRepository()
    static let instance = ProductRepositoryManager()
    
    private init() {}
    
    func creatProduct(product: Product) {
        productDataRepository.createProduct(product: product)
    }
    
    func getAllProducts() -> [Product]? {
        return productDataRepository.getAllProduct()
    }
    
    func getProductById(productId: UUID) -> Product? {
        return productDataRepository.getProductById(productId: productId)
    }
    
    func updateProduct(productId: UUID) -> Bool {
        return productDataRepository.updateProduct(id: productId)
    }
    
    func deleteAllProduct() -> Bool {
        let products = getAllProducts()
        guard products != nil else{
            return false
        }
        for product in products!{
            guard productDataRepository.deleteProduct(id: product.id!) == true else {
                return false 
            }
        }
        return true
    }
}
