//
//  ProductApiTest.swift
//  SampleApiProjectTests
//
//  Created by Pranjal Agarwal on 21/02/23.
//

import XCTest
@testable import SampleApiProject

final class ProductApiTest: XCTestCase {    
    func test_productApiResponse_withValidUrl_Returns_ProductList() {
        let fetchApiResource = FetchProductApi()
        let productApiResponseExpectation = expectation(description: "Product Api response should return product List")
        fetchApiResource.fetchProduct { products in
            XCTAssertNotNil(products)
            XCTAssertEqual(30, products.products!.count)
            productApiResponseExpectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }

    func test_productApiResponse_withStatusCode404_Returns_statusCode_and_message() {
        let errorUrl = URL(string: "https://dummyjson.com")!
        let fetchApiResponse = FetchProductApi(apiUrl: errorUrl)
        let apiResponse = expectation(description: "Should return status code with a message")
        fetchApiResponse.fetchProduct { data in
            XCTAssertNil(data.products)
            XCTAssertNotNil(data.status)
            XCTAssertNotNil(data.message)
            apiResponse.fulfill()
        }
        waitForExpectations(timeout: 8)
    }
}
