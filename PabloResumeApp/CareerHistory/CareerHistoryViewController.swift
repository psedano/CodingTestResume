//
//  CareerHistoryViewController.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/26/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import UIKit

class CareerHistoryViewController: UIViewController {
    @IBOutlet weak var historyTable: UITableView!
    @IBOutlet private weak var backButton: BackButton!
    
    var careerViewModel: CareerHistoryViewModel?
    typealias constants = CareerHistoryConstants

    override func viewDidLoad() {
        super.viewDidLoad()
        let careerCell = UINib(nibName: constants.careerCellID, bundle: nil)
        historyTable.register(careerCell, forCellReuseIdentifier: constants.careerCellID)
        historyTable.dataSource = self
        historyTable.delegate = self
        setupUI()
    }
    
    func setupUI() {
        historyTable.backgroundColor = UIColor.clear
        historyTable.rowHeight = UITableView.automaticDimension
        historyTable.estimatedRowHeight = 500
    }
    
    public func update(with viewModel: CareerHistoryViewModel) {
        self.careerViewModel = viewModel
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension CareerHistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let careerHistoryModel = careerViewModel?.careerHistoryModel else { return 0 }
        return careerHistoryModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: constants.careerCellID) as! CareerCell
        cell.updateCell(with: careerViewModel?.careerHistoryModel?[indexPath.row])
        return cell
    }
}
