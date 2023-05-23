//
//  ResultsViewController.swift
//  Subscription
//
//  Created by Самат Танкеев on 23.05.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    var subscriptionInfo: String?
    
    private let successMessage: UILabel = {
        let label = UILabel()
        label.text = "Поздравляем, подписка офрмлена успешно!"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subscriptionInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(successMessage)
        view.addSubview(subscriptionInfoLabel)
        configureConstraints()
        
        subscriptionInfoLabel.text = subscriptionInfo
    }
    
    func configureConstraints() {
        
        let successMessageLabelConstraints = [
            successMessage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            successMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            successMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ]
        let subscriptionInfoLabelConstraints = [
            subscriptionInfoLabel.topAnchor.constraint(equalTo: successMessage.bottomAnchor, constant: 20),
            subscriptionInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subscriptionInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(successMessageLabelConstraints)
        NSLayoutConstraint.activate(subscriptionInfoLabelConstraints)
    }
}

