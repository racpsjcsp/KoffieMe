//
//  OrderViewModel.swift
//  KoffieMe
//
//  Created by Rafael Plinio on 23/06/21.
//

import Foundation

class OrderListViewModel {
    var ordersViewModel: [OrderViewModel]

    init() {
        self.ordersViewModel = [OrderViewModel]()
    }

    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
}

struct OrderViewModel {
    let order: Order

    var name: String {
        return self.order.name
    }

    var coffeeName: String {
        return self.order.coffeeName.rawValue.capitalized
    }

    var total: Double {
        return self.order.total
    }

    var size: String {
        return self.order.size.rawValue.capitalized
    }


}
