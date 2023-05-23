//
//  ProductsViewController.swift
//  Subscription
//
//  Created by Самат Танкеев on 23.05.2023.
//

import UIKit

protocol ProductsViewControllerDelegate {
    func didTapProduct(product: Product)
}

class ProductsViewController: UIViewController {
    
    var products = ProductDatabase.products
    private let productsTable: UITableView = {
        let tableView = UITableView()
        tableView.register(ProductItemTableViewCell.self,
                           forCellReuseIdentifier: ProductItemTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var delegate: ProductsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        productsTable.delegate = self
        productsTable.dataSource = self
        view.addSubview(productsTable)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productsTable.frame = view.bounds
    }
    

}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductItemTableViewCell.identifier,
            for: indexPath) as? ProductItemTableViewCell else {
            return UITableViewCell()
        }
        let product = products[indexPath.row]
        
        cell.configure(with: ProductViewModel(name: product.name, image: product.image, price: product.price, weight: product.weight))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTapProduct(product: products[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
    
    
}


