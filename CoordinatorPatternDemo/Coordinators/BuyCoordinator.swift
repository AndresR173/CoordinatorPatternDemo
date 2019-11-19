//
//  BuyCoordinator.swift
//  CoordinatorPatternDemo
//
//  Created by Andres Rojas on 18/11/19.
//  Copyright © 2019 Andres Rojas. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    let item: Item

    weak var parentCoordinator: MainCoordinator?

    init(navigationController: UINavigationController, item: Item) {
        self.navigationController = navigationController
        self.item = item
    }

    func start() {
        let viewController = BuyViewController(item)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension BuyCoordinator: BuyViewControllerDelegate {
    func didFinishBuying() {
       /// Do whatever you want
    }

    func onDismiss() {
        parentCoordinator?.childDidFinish(self)
    }
}
