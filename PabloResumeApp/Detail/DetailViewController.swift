//
//  DetailViewController.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/25/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet private weak var mainPanel: UIView!
    @IBOutlet weak var sectionDescription: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var detailViewModel: DetailViewViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        sectionDescription.text = detailViewModel?.detailModel?.detail
        sectionDescription.font = UIFont(name: GlobalConstants.quicksandFontLight, size: 20)
        sectionDescription.numberOfLines = 0
        navigationController?.isNavigationBarHidden = true
        
        backButton.setTitle("", for: .normal)
        backButton.setImage(UIImage(named: "backIcon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        backButton.tintColor = UIColor.white
        backButton.backgroundColor = UIColor.neonBlue
        backButton.layer.cornerRadius = backButton.frame.width / 2
        
        mainPanel.backgroundColor = UIColor.dandelion
        mainPanel.layer.cornerRadius = 25
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}


