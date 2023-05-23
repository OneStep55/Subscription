//
//  OrderDetailsViewController.swift
//  Subscription
//
//  Created by Самат Танкеев on 23.05.2023.
//

import UIKit
class OrderDetailsViewController: UIViewController {
    private let dayOfWeekSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let deliveryPeriodSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Утро", "День", "Вечер"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Адрес доставки"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Номер телефона"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let subscriptionPeriodSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["1 месяц", "3 месяца", "6 месяцев", "1 год"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Итоговая цена"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subscribeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Оформить подписку", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(totalPriceLabel)
        view.addSubview(priceLabel)
        view.addSubview(dayOfWeekSegmentedControl)
        view.addSubview(deliveryPeriodSegmentedControl)
        view.addSubview(addressTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(subscriptionPeriodSegmentedControl)
        view.addSubview(subscribeButton)
        
        configureConstraints()
        subscribeButton.addTarget(self, action: #selector(subscribeButtonTapped), for: .touchUpInside)
    }
    
    func configure(price: Int) {
        priceLabel.text = "\(price) тг"
    }
    
    func configureConstraints() {
        let totalPriceLabelConstraints = [
            totalPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalPriceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ]
        
        let priceLabelConstraints = [
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            priceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ]
        
        let dayOfWeekSegmentedControlConstraints = [
            dayOfWeekSegmentedControl.topAnchor.constraint(equalTo: totalPriceLabel.bottomAnchor, constant: 20),
            dayOfWeekSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dayOfWeekSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        
        let deliveryPeriodSegmentedControlConstraints = [
            deliveryPeriodSegmentedControl.topAnchor.constraint(equalTo: dayOfWeekSegmentedControl.bottomAnchor, constant: 20),
            deliveryPeriodSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            deliveryPeriodSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        
        let addressTextFieldConstraints = [
            addressTextField.topAnchor.constraint(equalTo: deliveryPeriodSegmentedControl.bottomAnchor, constant: 20),
            addressTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addressTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        
        let phoneNumberTextFieldConstraints = [
            phoneNumberTextField.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 20),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        
        let subscriptionPeriodSegmentedControlConstraints = [
            subscriptionPeriodSegmentedControl.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20),
            subscriptionPeriodSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subscriptionPeriodSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        
        let subscribeButtonConstraints = [
            subscribeButton.topAnchor.constraint(equalTo: subscriptionPeriodSegmentedControl.bottomAnchor, constant: 40),
            subscribeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subscribeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            subscribeButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(totalPriceLabelConstraints)
        NSLayoutConstraint.activate(priceLabelConstraints)
        NSLayoutConstraint.activate(dayOfWeekSegmentedControlConstraints)
        NSLayoutConstraint.activate(deliveryPeriodSegmentedControlConstraints)
        NSLayoutConstraint.activate(addressTextFieldConstraints)
        NSLayoutConstraint.activate(phoneNumberTextFieldConstraints)
        NSLayoutConstraint.activate(subscriptionPeriodSegmentedControlConstraints)
        NSLayoutConstraint.activate(subscribeButtonConstraints)
    }
    
    @objc func subscribeButtonTapped() {
        let resultsViewController = ResultsViewController()
        resultsViewController.subscriptionInfo = createSubscriptionInfo()
        navigationController?.pushViewController(resultsViewController, animated: true)
    }
    
    func createSubscriptionInfo() -> String {
        // Create subscription information based on the selected options
        let dayOfWeek = dayOfWeekSegmentedControl.titleForSegment(at: dayOfWeekSegmentedControl.selectedSegmentIndex) ?? ""
        let deliveryPeriod = deliveryPeriodSegmentedControl.titleForSegment(at: deliveryPeriodSegmentedControl.selectedSegmentIndex) ?? ""
        let address = addressTextField.text ?? ""
        let phoneNumber = phoneNumberTextField.text ?? ""
        let subscriptionPeriod = subscriptionPeriodSegmentedControl.titleForSegment(at: subscriptionPeriodSegmentedControl.selectedSegmentIndex) ?? ""
        
        let subscriptionInfo = """
        Итоговая цена: \(priceLabel.text ?? "0")
        Предпочитаемый день: \(dayOfWeek)
        Период доставки: \(deliveryPeriod)
        Адресс: \(address)
        Номер телефона: \(phoneNumber)
        Срок подпики: \(subscriptionPeriod)
        """
        
        return subscriptionInfo
    }
}
