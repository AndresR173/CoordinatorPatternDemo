//
//  Coordinator.swift
//  CoordinatorPatternDemo
//
//  Created by Andres Rojas on 18/11/19.
//  Copyright © 2019 Andres Rojas. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }

    var navigationController: UINavigationController { get set }

    func start()
}
