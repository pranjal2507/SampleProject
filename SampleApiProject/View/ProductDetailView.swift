//
//  ProductDetailView.swift
//  SupportSampleProject
//
//  Created by Pranjal Agarwal on 25/02/23.
//

import UIKit

class ProductDetailView: UIView {
    var productId: UUID?
    var productDetailImageView = UIImageView()
    var productDetailPriceLabel = UILabel()
    var productDetailTitleLabel = UILabel()
    var productDetailDescriptionLabel = UILabel()
    var productDetailLikeButton = UIButton()
    var productDetailBrandLabel = UILabel()
    var productDetailStockLabel = UILabel()
    var priceLabel = UILabel()
    var brandLabel = UILabel()
    var stockLabel = UILabel()

    init (productId: UUID){
        super.init(frame: .zero)
        self.productId = productId
        setupProductDetail()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupProductDetail()
    }

    func setupProductDetail() {
        let product = ProductRepositoryManager.instance.getProductById(productId: productId!)!
        setupAutoLayout()
        setupProductDetailImage(imageUrl:product.thumbnail)
        setupProductLikeButton(currentStatus: product.isLiked!)
        setupProductTitle(productTitle: product.title)
        setupBrandLabel()
        setupProductBrand(productBrand:product.brand)
        setupProductStock(productStock:product.stock)
        setupStockLabel()
        setupPriceLabel()
        setupProductPrice(productPrice:product.price)
        setupProductDescription(productDescription:product.description)
    }

    func setupProductDetailImage (imageUrl: String) {
        addSubview(productDetailImageView)
        productDetailImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        productDetailImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor,constant: 30).isActive = true
        productDetailImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        productDetailImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        productDetailImageView.setImage(with: imageUrl)
        productDetailImageView.layer.cornerRadius = 10
        productDetailImageView.contentMode = .scaleToFill
        productDetailImageView.clipsToBounds = true
    }

    func setupProductLikeButton (currentStatus: Bool) {
        addSubview(productDetailLikeButton)
        productDetailLikeButton.tintColor = .red
        if currentStatus == true {
            productDetailLikeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else {
            productDetailLikeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        productDetailLikeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        productDetailLikeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        productDetailLikeButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20).isActive = true
        productDetailLikeButton.imageView?.layer.transform = CATransform3DMakeScale(2, 2, 2)
    }

    func setupProductTitle (productTitle: String) {
        addSubview(productDetailTitleLabel)
        productDetailTitleLabel.text = productTitle
        productDetailTitleLabel.font = .boldSystemFont(ofSize: 20)
        productDetailTitleLabel.numberOfLines = 0
        productDetailTitleLabel.trailingAnchor.constraint(equalTo: productDetailLikeButton.leadingAnchor).isActive = true
        productDetailTitleLabel.topAnchor.constraint(equalTo: productDetailImageView.bottomAnchor,constant: 10).isActive = true
        productDetailTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30).isActive = true
        productDetailTitleLabel.textAlignment = .center
        productDetailLikeButton.centerYAnchor.constraint(equalTo: productDetailTitleLabel.centerYAnchor).isActive = true
    }

    func setupProductBrand(productBrand: String) {
        addSubview(productDetailBrandLabel)
        productDetailBrandLabel.numberOfLines = 0
        productDetailBrandLabel.text = productBrand
        productDetailBrandLabel.font = .systemFont(ofSize: 23)
        productDetailBrandLabel.leadingAnchor.constraint(equalTo: brandLabel.trailingAnchor,constant: 10).isActive = true
        productDetailBrandLabel.centerYAnchor.constraint(equalTo: brandLabel.centerYAnchor).isActive = true
    }

    func setupBrandLabel() {
        addSubview(brandLabel)
        brandLabel.text = "Brand"
        brandLabel.backgroundColor = .black
        brandLabel.textColor = .white
        brandLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30).isActive = true
        brandLabel.topAnchor.constraint(equalTo:productDetailTitleLabel.bottomAnchor,constant: 30).isActive = true
        brandLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        brandLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        brandLabel.textAlignment = .center
    }

    func setupStockLabel() {
        addSubview(stockLabel)
        stockLabel.text = "Stock"
        stockLabel.backgroundColor = .black
        stockLabel.textColor = .white
        stockLabel.trailingAnchor.constraint(equalTo: productDetailStockLabel.leadingAnchor,constant: -10).isActive = true
        stockLabel.topAnchor.constraint(equalTo:productDetailBrandLabel.topAnchor).isActive = true
        stockLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stockLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        productDetailBrandLabel.trailingAnchor.constraint(equalTo: stockLabel.leadingAnchor,constant: -20).isActive = true
        productDetailStockLabel.centerYAnchor.constraint(equalTo: stockLabel.centerYAnchor).isActive = true
        stockLabel.textAlignment = .center
    }

    func setupProductStock(productStock: Int) {
        addSubview(productDetailStockLabel)
        productDetailStockLabel.text = "\(productStock)"
        productDetailStockLabel.font = .systemFont(ofSize: 23)
        productDetailStockLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5).isActive = true
    }

    func setupPriceLabel () {
        addSubview(priceLabel)
        priceLabel.text = "Price"
        priceLabel.textColor = .white
        priceLabel.backgroundColor = .black
        priceLabel.textAlignment = .center
        priceLabel.font = .systemFont(ofSize: 18)
        priceLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: centerXAnchor,constant: -10).isActive = true
        priceLabel.topAnchor.constraint(equalTo: productDetailStockLabel.bottomAnchor,constant: 20).isActive = true
    }

    func setupProductPrice(productPrice: Int) {
        addSubview(productDetailPriceLabel)
        productDetailPriceLabel.text = "₹ \(productPrice)"

        productDetailPriceLabel.font = .systemFont(ofSize: 20)
        productDetailPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor,constant: 10).isActive = true
        productDetailPriceLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor).isActive = true
    }

    func setupProductDescription(productDescription: String) {
        addSubview(productDetailDescriptionLabel)
        productDetailDescriptionLabel.text = productDescription
        productDetailDescriptionLabel.font = .systemFont(ofSize: 20)
        productDetailDescriptionLabel.numberOfLines = 0
        productDetailDescriptionLabel.textAlignment = .center
        productDetailDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        productDetailDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant:-10).isActive = true
        productDetailDescriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor,constant: 5).isActive = true
    }

    func setupAutoLayout() {
        productDetailImageView.translatesAutoresizingMaskIntoConstraints = false
        productDetailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        productDetailBrandLabel.translatesAutoresizingMaskIntoConstraints = false
        productDetailLikeButton.translatesAutoresizingMaskIntoConstraints = false
        productDetailPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        productDetailStockLabel.translatesAutoresizingMaskIntoConstraints = false
        productDetailDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        stockLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
