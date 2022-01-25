//
//  OptionsTableViewController.swift
//  WheelyApp
//
//  Created by Daniel Lam on 25/01/22.
//

import UIKit

class OptionsTableViewController: UITableViewController {

    let optionManager = OptionManager.shared
    
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
        let alertController = UIAlertController(title: "Add Option", message: "", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter option"
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertController.addAction((UIAlertAction(title: "Submit", style: .default, handler: { _ in
            if let option = alertController.textFields?[0].text {

            }
            self.tableView.reloadData()
        })))
        
        present(alertController, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
