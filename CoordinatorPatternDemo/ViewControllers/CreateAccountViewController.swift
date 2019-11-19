//
//  CreateAccountViewController.swift
//  CoordinatorPatternDemo
//
//  Created by Andres Rojas on 18/11/19.
//  Copyright © 2019 Andres Rojas. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = false
    }

}
