//
//  ProductTableViewCell.swift
//  Subscription
//
//  Created by Самат Танкеев on 22.05.2023.
//

import UIKit

protocol ProductTableViewCellDelegate{
    func productTableViewCell(_ cell: ProductTableViewCell, didChangePriceTo price: Double)
}

class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "ProductTableViewCell"
    var price: Double?
    var newPrice: Double?
    var weight: Double? 
    var delegate: ProductTableViewCellDelegate?
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
    
    private let quantity: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
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
        contentView.addSubview(quantity)
        contentView.addSubview(stepper)
        contentView.addSubview(priceLabel)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @objc func stepperChanged() {
        quantity.text = "\(stepper.value) кг"
        let diff = (stepper.value / weight!) * price! - newPrice!
        delegate?.productTableViewCell(self, didChangePriceTo: diff)
        newPrice = (stepper.value / weight!) * price!
        priceLabel.text = "\(newPrice!) тг"
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
        
        let quanitiyConstrains = [
            quantity.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16),
            quantity.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 8),
        ]
        
        let stepperConstrains = [
            stepper.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 8),
            stepper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ]
        
        let priceLabelCinstrains = [
            priceLabel.topAnchor.constraint(equalTo: quantity.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16)
        ]
       
        
        NSLayoutConstraint.activate(productImageConstraints)
        NSLayoutConstraint.activate(productNameConstraints)
        NSLayoutConstraint.activate(quanitiyConstrains)
        NSLayoutConstraint.activate(stepperConstrains)
        NSLayoutConstraint.activate(priceLabelCinstrains)
    }
    
    func configure(with viewModel: ProductViewModel) {
        productImage.image = viewModel.image
        productName.text = viewModel.name
        weight = viewModel.weight
        stepper.minimumValue = weight!
        stepper.value = weight!
        quantity.text = "\(viewModel.weight) кг"
        stepper.stepValue = viewModel.weight
        price = Double(viewModel.price)
        newPrice = price!
        priceLabel.text = ("\(price!) тг")
    }
}
