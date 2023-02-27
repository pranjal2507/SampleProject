//
//  ProductDetailController.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 15/02/23.
//

import UIKit

protocol ProductStatusImageDelegate {
    func updateProductStatusImage(currentIndexPath:IndexPath) -> Void
}

class ProductDetailController: UIViewController {
    var productId: UUID?
    var currentIndexPath: IndexPath?
    var productStatusImageDelegate: ProductStatusImageDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureProductDetail()
    }

    func configureProductDetail() {
        let productDetailView = ProductDetailView(productId: productId!)
        self.view.addSubview(productDetailView)
        productDetailView.pin(to: self.view)
        productDetailView.productDetailLikeButton.addTarget(self, action: #selector(productStatusImageChanged(sender:)), for: .touchUpInside)
    }
    
    @objc func productStatusImageChanged(sender: UIButton) {
        let _ = ProductRepositoryManager.instance.updateProduct(productId: productId!)
        let currentStatus = ProductRepositoryManager.instance.getProductById(productId: productId!)?.isLiked!
        if currentStatus == true {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        productStatusImageDelegate?.updateProductStatusImage(currentIndexPath: currentIndexPath!)
    }
}

