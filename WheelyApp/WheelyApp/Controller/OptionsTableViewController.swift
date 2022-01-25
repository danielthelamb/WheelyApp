//
//  OptionsTableViewController.swift
//  WheelyApp
//
//  Created by Daniel Lam on 25/01/22.
//

import UIKit

class OptionsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
    }

    private func configureNavigationBar() {
        navigationItem.title = "Add Options"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddOption))

        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func showAddOption() {

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
