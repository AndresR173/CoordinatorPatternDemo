//
//  BuyViewController.swift
//  CoordinatorPatternDemo
//
//  Created by Andres Rojas on 18/11/19.
//  Copyright © 2019 Andres Rojas. All rights reserved.
//

import UIKit

protocol BuyViewControllerDelegate: class {
    func didFinishBuying()

    func onDismiss()
}

class BuyViewController: UIViewController {
    weak var coordinator: BuyViewControllerDelegate?

    let item: Item

    init(_ item: Item) {
        self.item = item

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.onDismiss()
    }

}
