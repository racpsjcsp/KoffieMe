//
//  AddOrderViewController.swift
//  KoffieMe
//
//  Created by Rafael Plinio on 23/06/21.
//

import Foundation
import UIKit

class AddOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    private var coffeeSegmentedControl: UISegmentedControl!

    var viewModel = AddCoffeeOrderViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        //already done in storyboard
//        tableView.dataSource = self
//        tableView.delegate = self
        setupSegmentedControl()
    }


    func setupSegmentedControl() {
        coffeeSegmentedControl = UISegmentedControl(items: viewModel.sizes)
        coffeeSegmentedControl.selectedSegmentTintColor = .green
        coffeeSegmentedControl.backgroundColor = .black

        let normalText = [NSAttributedString.Key.foregroundColor: UIColor.white]
        coffeeSegmentedControl.setTitleTextAttributes(normalText, for: .normal)

        let selectedText = [NSAttributedString.Key.foregroundColor: UIColor.black]
        coffeeSegmentedControl.setTitleTextAttributes(selectedText, for: .selected)

        view.addSubview(coffeeSegmentedControl)

        //constraints
        coffeeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false

        coffeeSegmentedControl.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        coffeeSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coffeeNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeNameTableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.coffeeNames[indexPath.row]
        return cell
    }
}
