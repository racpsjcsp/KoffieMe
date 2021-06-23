//
//  AddCoffeeOrderViewModel.swift
//  KoffieMe
//
//  Created by Rafael Plinio on 23/06/21.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var total: Double?

    var coffeeNames: [String] {
        return CoffeeName.allCases.map { $0.rawValue.capitalized }
    }

    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }

}
