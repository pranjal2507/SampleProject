//
//  ProductTableExtension.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 14/02/23.
//

import Foundation
import UIKit

// extension for product table data source delegate
extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productDataResponse?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell",for: indexPath) as! ProductCell
        let currentIndex = indexPath.row
        productCell.setupProductCell(
            imageUrl: productDataResponse![currentIndex].thumbnail,
            currentStatus: productDataResponse![currentIndex].isLiked!,
            productTitle: productDataResponse![currentIndex].title,
            productDescription: productDataResponse![currentIndex].description,
            productPrice: productDataResponse![currentIndex].price)
        productCell.productLikeButton.tag = currentIndex
        productCell.productLikeButton.addTarget(self, action: #selector(changeProductStatusImg(sender:)), for: .touchUpInside)
        return productCell
    }

    @objc func changeProductStatusImg(sender: UIButton) {
        let productId  = productDataResponse![sender.tag].id!
        let _ = ProductRepositoryManager.instance.updateProduct(productId: productId)
        let updatedProduct = ProductRepositoryManager.instance.getProductById(productId: productId)!
        productDataResponse![sender.tag] = updatedProduct
        let updatedProductImg = getProductStatusImage(product: updatedProduct)
        sender.setImage( updatedProductImg, for: .normal)
    }
    
    func getProductStatusImage(product: Product) -> UIImage {
        if product.isLiked == true {
            return UIImage(systemName: "heart.fill")!
        }
        else {
            return UIImage(systemName: "heart")!
        }
    }
}

// extension for Product Table Delegate
extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productId:UUID = productDataResponse![indexPath.row].id!
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "productDetailController")
        as! ProductDetailController
        secondViewController.productId = productId
        secondViewController.currentIndexPath = indexPath
        secondViewController.productStatusImageDelegate = self
        self.navigationController?.pushViewController(secondViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// extension for fetching product from api through delegate
extension ViewController:ProductApiDelegate {
    func getAllProduct(productResponse: [Product]?) {
        productTable.isHidden = false
        productDataResponse = productResponse
        DispatchQueue.main.async {
            self.productTable.reloadData()
        }
    }
}

// extension for updating product table from product detail controller through delegate
extension ViewController: ProductStatusImageDelegate {
    func updateProductStatusImage(currentIndexPath: IndexPath) {
        productDataResponse![currentIndexPath.row] = ProductRepositoryManager.instance.getProductById(productId: productDataResponse![currentIndexPath.row].id!)!
        productTable.reloadData()
    }
}

extension ViewController: ProductApiErrorDelegate {
    func handleErrorFromProductApi(status: String, message: String) {
        DispatchQueue.main.async {
            self.errorPageView.statusLabel.text = status
            self.errorPageView.messageLabel.text = message
            self.errorPageView.isHidden = false
            self.productTable.isHidden = true
        }
    }
}


