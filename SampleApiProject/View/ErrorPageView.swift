//
//  ErrorPageView.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 25/02/23.
//
import UIKit

class ErrorPageView: UIView {
    var status:String?
    var message:String?
    var imageView = UIImageView()
    var statusLabel = UILabel()
    var messageLabel = UILabel()

    init(status:String = "404",message:String = "Page not found") {
        super.init(frame: .zero)
        self.status = status
        self.message = message
        setupErrorView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupErrorView()
    }

    func setupErrorView() {
        setupImageView()
        setStatusLabelView()
        setMessageLabelView()
    }

    func setupImageView () {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let notAvailableImage = UIImage(systemName: "multiply")
        imageView.image = notAvailableImage
        imageView.tintColor = .red
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

    }

    func setStatusLabelView() {
        addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Status Code : \(status!)"
        statusLabel.font = .boldSystemFont(ofSize: 23)
        statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        statusLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }

    func setMessageLabelView() {
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .boldSystemFont(ofSize: 23)
        messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 40).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        messageLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
