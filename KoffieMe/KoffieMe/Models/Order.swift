//
//  Order.swift
//  KoffieMe
//
//  Created by Rafael Plinio on 23/06/21.
//

import Foundation

enum CoffeeName: String, Codable, CaseIterable {
    case cappucino
    case latte
    case expresso
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    var name: String
    var coffeeName: CoffeeName
    var total: Double
    var size: CoffeeSize
}
