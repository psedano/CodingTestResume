//
//  CareerCell.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/26/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import UIKit

class CareerCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dates: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var jobDescription: UILabel!
    @IBOutlet weak var companyLogo: UIImageView!
    
    func updateCell(with viewModel: CareerHistoryModel?) {
        title.text = viewModel?.title
        dates.text = viewModel?.dates
        position.text = viewModel?.position
        jobDescription.text = viewModel?.jobDescription
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        containerView.backgroundColor = UIColor.bittersweet
        containerView.layer.cornerRadius = 20
        
        companyLogo.image = UIImage(named: "globant")
        title.numberOfLines = 0
        title.font = UIFont(name: GlobalConstants.quicksandFontBold, size: 20)
        title.textColor = UIColor.white
        title.textAlignment = .center
        dates.numberOfLines = 0
        dates.font = UIFont(name: GlobalConstants.quicksandFontBold, size: 20)
        dates.textColor = UIColor.white
        position.numberOfLines = 0
        position.font = UIFont(name: GlobalConstants.quicksandFontBold, size: 20)
        position.textColor = UIColor.white
        jobDescription.numberOfLines = 0
        jobDescription.font = UIFont(name: GlobalConstants.quicksandFontLight, size: 16)
        jobDescription.textColor = UIColor.white
    }
}
