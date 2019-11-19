//
//  ViewController.swift
//  CoordinatorPatternDemo
//
//  Created by Andres Rojas on 18/11/19.
//  Copyright © 2019 Andres Rojas. All rights reserved.
//

import UIKit

protocol ViewControllerCoordinatorDelegate: class {
    func didShowBuyScreen(_ item: Item)
    func didShowCreateAccountScreen()
}

class ViewController: UIViewController {

    // MARK: - UI Elements

    lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buy", for: .normal)
        button.addTarget(self, action: #selector(showBuyScreen), for: .touchUpInside)

        return button
    }()

    lazy var accountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Account", for: .normal)
        button.addTarget(self, action: #selector(showAccountScreen), for: .touchUpInside)

        return button
    }()

    lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8

        stack.addArrangedSubview(buyButton)
        stack.addArrangedSubview(accountButton)

        return stack
    }()

    // MARK: - Properties

    weak var coordinator: ViewControllerCoordinatorDelegate?

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemGray6
        } else {
            // Fallback on earlier versions
        }

        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.isNavigationBarHidden = true
    }

}

// MARK: - Helpers

extension ViewController {

    private func configureUI() {
        view.addSubview(buttonStack)

        NSLayoutConstraint.activate([
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func showBuyScreen() {
        coordinator?.didShowBuyScreen(Item.items.randomElement()!)
    }

    @objc private func showAccountScreen() {
        coordinator?.didShowCreateAccountScreen()
    }
}

