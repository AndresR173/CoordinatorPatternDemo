//
//  Item.swift
//  CoordinatorPatternDemo
//
//  Created by Andres Rojas on 19/11/19.
//  Copyright © 2019 Andres Rojas. All rights reserved.
//

import Foundation

struct Item {
    let id = UUID()
    let name: String
}

extension Item {
    static let items = [
        Item(name: "Item 1"),
        Item(name: "Item 2")
    ]
}
