//
//  ProductsDatabase.swift
//  Subscription
//
//  Created by Самат Танкеев on 23.05.2023.
//

import UIKit


class ProductDatabase {
    static let products = [
        Product(name: "Яблоки", image: UIImage(named: "apple")!, price: 400, weight: 1),
        Product(name: "Бананы", image: UIImage(named: "banana")!, price: 700, weight: 1),
        Product(name: "Вишня", image: UIImage(named: "cherry")!, price: 600, weight: 0.5),
        Product(name: "Молоко", image: UIImage(named: "milk")!, price: 400, weight: 1),
        Product(name: "Апельсины", image: UIImage(named: "orange")!, price: 679, weight: 1),
        Product(name: "Персики", image: UIImage(named: "peach")!, price: 800, weight: 1),
        Product(name: "Сметана", image: UIImage(named: "sour_cream")!, price: 500, weight: 0.250)
    ]
    
    static func getProducts() -> [Product] {
        return products
    }
}
