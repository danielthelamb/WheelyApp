//
//  ViewController.swift
//  WheelyApp
//
//  Created by Daniel Lam on 25/01/22.
//

import UIKit
import Charts

class OptionsPieChartViewController: UIViewController {
    
    private let spinButton: UIButton = {
        let button = UIButton()
        button.setTitle("Spin", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(spin), for: .touchUpInside)
        
        return button
    }()
    
    private let pieView: PieChartView = {
        let pieView = PieChartView()
        pieView.chartDescription?.enabled = false
        pieView.drawHoleEnabled = false
        pieView.rotationEnabled = true
        pieView.isUserInteractionEnabled = false
        pieView.legend.enabled = false
        
        return pieView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavigationBar()
    }

    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(spinButton)
        spinButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        
        view.addSubview(pieView)
        pieView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: spinButton.topAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Options"
        
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(goToAddOption))

        navigationItem.rightBarButtonItem = addButton
    }
    
    private func setupPieChart() {
        var entries: [PieChartDataEntry] = []
        
        for options in OptionManager.options {
            entries.append(PieChartDataEntry(value: 1.0, label: options.name))
        }

        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.drawValuesEnabled = false
        dataSet.colors = [UIColor.gray, UIColor.darkGray, UIColor.systemGray, UIColor.systemGray2, UIColor.systemGray3, UIColor.systemGray4, UIColor.systemGray5, UIColor.lightGray]
        
        pieView.data = PieChartData(dataSet: dataSet)
    }
    
    @objc func goToAddOption() {
        let controller = OptionsTableViewController()
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func spin() {
        
    }

}

extension OptionsPieChartViewController: OptionsTableViewProtocol {
    func didAddOption() {
        setupPieChart()
    }
}

