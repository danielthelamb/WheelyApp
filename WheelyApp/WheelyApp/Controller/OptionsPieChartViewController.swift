//
//  ViewController.swift
//  WheelyApp
//
//  Created by Daniel Lam on 25/01/22.
//

import UIKit
import Charts

class OptionsPieChartViewController: UIViewController {
    
    let optionManager = OptionManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavigationBar()
    }

    private func configureUI() {
        view.backgroundColor = .white
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Options"
        
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(goToAddOption))

        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func goToAddOption() {
        let controller = OptionsTableViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

}

