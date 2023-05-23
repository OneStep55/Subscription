//
//  ViewController.swift
//  Subscription
//
//  Created by Самат Танкеев on 21.05.2023.
//

import UIKit



class CartViewController: UIViewController {
    
    var addedProducts = [Product](){
        didSet {
            productsTable.reloadData()
        }
    }
    var price: Int = 0 {
        didSet {
            nextButton.setTitle("Далее \(price) тг", for: .normal)
        }
    }
    
    let addButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 7
    
        return button
    }()
    
   
    private let productsTable: UITableView = {
        
        let tableView = UITableView()
        tableView.register(ProductTableViewCell.self,
                           forCellReuseIdentifier: ProductTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        productsTable.dataSource = self
        productsTable.delegate = self
        
        view.addSubview(productsTable)
        view.addSubview(nextButton)
        configureConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .done, target: self, action: #selector(addProduct))
        nextButton.addTarget(self, action: #selector(goToDetails), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
    }
    
    func configureConstraints() {
        let productsTableConstrains = [
            productsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productsTable.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -16)
        ]
        
    
     
        let nextButtonConstrains = [
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(productsTableConstrains)
        NSLayoutConstraint.activate(nextButtonConstrains)
    }
    
    @objc func addProduct(){
        
        let vc = ProductsViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func goToDetails(){
        
        let vc = OrderDetailsViewController()
        vc.configure(price: price)
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addedProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductTableViewCell.identifier,
            for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        let product = addedProducts[indexPath.row]
        cell.configure(with: ProductViewModel(name: product.name, image: product.image, price: product.price, weight: product.weight))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            price -= addedProducts[indexPath.row].price
            addedProducts.remove(at: indexPath.row)
        default:
            break
        }
        
        
    }
}

extension CartViewController: ProductsViewControllerDelegate {
    func didTapProduct(product: Product) {
        addedProducts.append(product)
        price += product.price
    }
    
    
}

extension CartViewController: ProductTableViewCellDelegate {
    func productTableViewCell(_ cell: ProductTableViewCell, didChangePriceTo price: Double) {
        self.price += Int(price)
    }
    
}

