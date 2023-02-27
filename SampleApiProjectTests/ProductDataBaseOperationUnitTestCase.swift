//
//  ProductDataBaseOperationUnitTestCase.swift
//  SampleApiProjectTests
//
//  Created by Pranjal Agarwal on 21/02/23.
//

import XCTest
@testable import SampleApiProject
import CoreData
final class ProductDataBaseOperationUnitTestCase: XCTestCase {
    func test_getProduct_withInvalid_id_Return_nil() {
        let product = ProductRepositoryManager.instance.getProductById(productId: UUID())
        XCTAssertNil(product)
    }

    func test_getProduct_withValidId_Returns_Product() {

        let products = ProductRepositoryManager.instance.getAllProducts()
        XCTAssertNotNil(products)
        XCTAssertTrue(products!.count > 0)
        let productId = products!.first?.id
        let  product = ProductRepositoryManager.instance.getProductById(productId: productId!)
        XCTAssertNotNil(product)
        XCTAssertEqual(products!.first?.title, product?.title)
    }

    // when data is present in database
    func test_getAllProduct_Returns_ProductArray(){
        let products = ProductRepositoryManager.instance.getAllProducts()
        XCTAssertNotNil(products)
        XCTAssertTrue(products!.count > 0)
    }
}
