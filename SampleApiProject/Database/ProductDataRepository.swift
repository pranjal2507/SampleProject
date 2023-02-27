//
//  ProductDataRepository.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 14/02/23.
//

import Foundation
import CoreData

protocol ProductRepository {
    func getAllProduct() -> [Product]?
    func createProduct(product: Product)
    func updateProduct(id: UUID) -> Bool
    func getProductById(productId: UUID) -> Product?
}

struct ProductDataRepository: ProductRepository {
    
    func getAllProduct() -> [Product]? {
        do {
            guard let result = try PersistentStorage.shared.context.fetch(CDProduct.fetchRequest()) as? [CDProduct]  else {
                return nil
            }
            var products: [Product]? = []
            result.forEach { cdProduct in
                let product = cdProduct.convertToProduct()
                products?.append(product)
            }
            return products
        }
        catch let error {
            print("Error occured while getting all product \(error.localizedDescription)")
        }
        return nil
    }
    
    func createProduct(product: Product) {
        let cdProduct = CDProduct(context: PersistentStorage.shared.context)
        cdProduct.title = product.title
        cdProduct.productDescription = product.description
        cdProduct.imageUrl = product.thumbnail
        cdProduct.stock = Int16(product.stock)
        cdProduct.brand = product.brand
        cdProduct.isLiked = product.isLiked!
        cdProduct.id = product.id!
        cdProduct.price = Int32(product.price)
        PersistentStorage.shared.saveContext()
    }
    
    func updateProduct(id: UUID) -> Bool {
        let cdProduct = getCDProduct(byIdentifier: id)
        guard cdProduct != nil else {
            return false
        }
        let currentLikeStatus = cdProduct?.isLiked ?? false
        cdProduct?.isLiked = !currentLikeStatus
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func deleteProduct(id: UUID) -> Bool {
        let cdProduct = getCDProduct(byIdentifier: id)
        guard cdProduct != nil else {
            return false
        }
        PersistentStorage.shared.context.delete(cdProduct!)
        return true
    }
    
    func getProductById(productId: UUID) -> Product? {
        let result = getCDProduct(byIdentifier: productId)
        guard result != nil else {
            return nil
        }
        let product = result?.convertToProduct()
        return product
    }
    
    private func getCDProduct(byIdentifier id: UUID) -> CDProduct? {
        let fetchRequest = NSFetchRequest<CDProduct>(entityName: "CDProduct")
        let predicate = NSPredicate(format: "id==%@",id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            guard let result = try PersistentStorage.shared.context.fetch(fetchRequest).first else {
                return nil
            }
            return result
        }
        catch let error {
            print("error is \(error.localizedDescription)")
        }
        return nil
    }
}
