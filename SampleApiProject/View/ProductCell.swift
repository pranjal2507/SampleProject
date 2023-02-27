//
//  ProductCell.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 14/02/23.
//

import UIKit

class ProductCell: UITableViewCell {

    var productImageView = UIImageView()
    var priceLabel = UILabel()
    var productPriceLabel = UILabel()
    var productTitleLabel = UILabel()
    var productDescriptionLabel = UILabel()
    var productLikeButton = UIButton()
    var imageUrl:String?

    func setupProductCell(imageUrl:String,currentStatus:Bool = true,productTitle:String,productDescription: String,productPrice:Int) {
        self.imageUrl = imageUrl
        setupAutoLayout()
        setupProductImage(imageUrl: imageUrl)
        setupProductTitle(productTitle: productTitle)
        setupPriceLabel()
        setupProductPrice(productPrice:productPrice)
        setupProductLikeButton(currentStatus: currentStatus )
        setupProductDescription(productDescription:productDescription)
    }

    func setupProductImage(imageUrl:String) {
        addSubview(productImageView)
        productImageView.setImage(with: imageUrl)
        productImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
        productImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        productImageView.setImage(with: imageUrl)
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 10
    }

    func setupProductTitle(productTitle:String) {
        addSubview(productTitleLabel)
        productTitleLabel.font = .systemFont(ofSize: 18)
        productTitleLabel.text = productTitle
        productTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        productTitleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        productTitleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,constant: 10).isActive = true
    }

    func setupPriceLabel() {
        addSubview(priceLabel)
        priceLabel.text = "Price"
        priceLabel.backgroundColor = .black
        priceLabel.textColor = .white
        priceLabel.textAlignment = .center
        priceLabel.font = .systemFont(ofSize: 23)
        priceLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,constant: 10).isActive = true
        priceLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor,constant: 10).isActive = true
    }

    func setupProductPrice(productPrice: Int) {
        addSubview(productPriceLabel)
        productPriceLabel.text = " ₹\(productPrice)"
        productPriceLabel.font = .systemFont(ofSize: 20)
        productPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor,constant: 10).isActive = true
        productPriceLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor).isActive = true
    }

    func setupProductDescription(productDescription: String) {
        addSubview(productDescriptionLabel)
        productDescriptionLabel.numberOfLines = 1
        productDescriptionLabel.font = .systemFont(ofSize: 20)
        productDescriptionLabel.text = productDescription
        productDescriptionLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,constant: 10).isActive = true
        productDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
        productDescriptionLabel.topAnchor.constraint(equalTo: productPriceLabel.bottomAnchor,constant: 10).isActive = true
        productDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -1).isActive = true
    }

    func setupProductLikeButton(currentStatus: Bool) {
        addSubview(productLikeButton)
        productLikeButton.tintColor = .red
        if currentStatus == true {
            productLikeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else {
            productLikeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        productLikeButton.imageView?.layer.transform = CATransform3DMakeScale(1.8, 1.8, 1.8)
        productLikeButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        productLikeButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        productLikeButton.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor,constant: -8).isActive = true
        productLikeButton.topAnchor.constraint(equalTo: productImageView.topAnchor,constant: 8).isActive = true
    }

    func setupAutoLayout () {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        productTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        productLikeButton.translatesAutoresizingMaskIntoConstraints = false
    }
}
