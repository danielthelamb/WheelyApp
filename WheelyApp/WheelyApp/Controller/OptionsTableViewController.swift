//
//  OptionsTableViewController.swift
//  WheelyApp
//
//  Created by Daniel Lam on 25/01/22.
//

import UIKit

private let reuseIdentifier = "OptionsTableViewCell"

protocol OptionsTableViewProtocol: NSObject {
    func didAddOption()
}

class OptionsTableViewController: UITableViewController {
    
    weak var delegate: OptionsTableViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureTableView()
    }

    private func configureNavigationBar() {
        navigationItem.title = "Add Options"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddOption))

        navigationItem.rightBarButtonItem = addButton
    }
    
    private func configureTableView() {
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    @objc func showAddOption() {
        let alertController = UIAlertController(title: "Add Option", message: "", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter option"
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertController.addAction((UIAlertAction(title: "Submit", style: .default, handler: { _ in
            if let option = alertController.textFields?[0].text {
                OptionManager().addOption(Option(name: option))
            }
            self.delegate?.didAddOption()
            self.tableView.reloadData()
        })))
        
        present(alertController, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OptionManager.options.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! OptionsTableViewCell
        cell.textLabel?.text = OptionManager.options[indexPath.row].name
        return cell
    }

}
