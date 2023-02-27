//
//  ViewController.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 14/02/23.
//

import UIKit

class ViewController: UIViewController {
    let productTable = UITableView()
    var productDataResponse: [Product]?
    let fetchProductApi = FetchProductApi()
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    let stackView = UIStackView()
    let errorPageView = ErrorPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(stackView)
        stackView.pin(to: self.view)
        productTable.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        productTable.rowHeight = 140
        productTable.delegate = self
        productTable.dataSource = self
        stackView.addSubview(productTable)
        productTable.pin(to: stackView)
        stackView.addSubview(errorPageView)
        errorPageView.pin(to: stackView)
        errorPageView.isHidden = true
        productDataResponse = appDelegate?.productDataResposne
        if productDataResponse == nil || productDataResponse?.count == 0 {
            var productViewModel = ProductViewModel(fetchProductApi: fetchProductApi)
            productViewModel.productApiErrorDelegate = self
            productViewModel.productDelegate = self
            productViewModel.fetchProduct()
        }
    }
}


