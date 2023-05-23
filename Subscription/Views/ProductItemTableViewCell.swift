//
//  ProductItemTableViewCell.swift
//  Subscription
//
//  Created by Самат Танкеев on 23.05.2023.
//

import UIKit

class ProductItemTableViewCell: UITableViewCell {
    
    static let identifier = "ProductItemTableViewCell"
    
    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let productName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        contentView.addSubview(productName)
        contentView.addSubview(priceLabel)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        let productImageConstraints = [
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            productImage.widthAnchor.constraint(equalToConstant: 140)
        ]
        
        let productNameConstraints = [
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16),
            productName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            productName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ]
        
        
        let priceLabelCinstrains = [
            priceLabel.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16)
        ]
       
        
        NSLayoutConstraint.activate(productImageConstraints)
        NSLayoutConstraint.activate(productNameConstraints)
        NSLayoutConstraint.activate(priceLabelCinstrains)
    }
    
    func configure(with model: ProductViewModel) {
        productImage.image = model.image
        productName.text = model.name
        priceLabel.text = "\(model.price) тг за \(model.weight) кг"
        
    }

}
