//
//  OrdersTableViewController.swift
//  KoffieMe
//
//  Created by Rafael Plinio on 23/06/21.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {

    var orderListViewModel = OrderListViewModel()

    let refresh = UIRefreshControl()


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.addSubview(refresh)
        refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)

        populateOrders()
    }

    private func populateOrders() {

        guard let coffeeOrdersURL = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL incorrect")
        }

        let resource = Resource<[Order]>(url: coffeeOrdersURL)

        WebService().load(resource: resource) { [weak self] result in
            switch result {
            case .success(let orders):
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = self.orderListViewModel.orderViewModel(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.coffeeName
        cell.detailTextLabel?.text = viewModel.size
        return cell
    }

    @objc func handleRefresh(refresh: UIRefreshControl) {
        populateOrders()

        let title = "Updating orders..."
        refresh.attributedTitle = NSAttributedString(string: title)

        tableView.reloadData()
        refresh.endRefreshing()
    }
}
