//
//  Order.swift
//  KoffieMe
//
//  Created by Rafael Plinio on 23/06/21.
//

import Foundation

enum CoffeeName: String, Codable {
    case cappucino
    case latte
    case expresso
}

enum CoffeeSize: String, Codable {
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
