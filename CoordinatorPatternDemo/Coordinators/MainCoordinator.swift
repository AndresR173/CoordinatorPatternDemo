//
//  MainCoordinator.swift
//  CoordinatorPatternDemo
//
//  Created by Andres Rojas on 18/11/19.
//  Copyright © 2019 Andres Rojas. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    // MARK: - Properties
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController

    // MARK: - LifeCycle
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Helpers
    func start() {
        let viewController = ViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

}

// MARK: - ViewController Coordinator Delegate
extension MainCoordinator: ViewControllerCoordinatorDelegate {
    func didShowBuyScreen(_ item: Item) {
        let child = BuyCoordinator(navigationController: navigationController, item: item)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }

    func didShowCreateAccountScreen() {
        let vc = CreateAccountViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

}
