//
//  ResumeCell.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/25/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import UIKit

class ResumeCell: UITableViewCell {
    @IBOutlet weak var sectionDescription: UILabel!
    @IBOutlet weak var containerView: UIView!

    static let cellHeight: CGFloat = 200
    var resumeCellViewModel: ResumeCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        sectionDescription.font = UIFont(name: GlobalConstants.quicksandFontBold, size: 30)
        sectionDescription.textColor = UIColor.white
        sectionDescription.numberOfLines = 0
        sectionDescription.textAlignment = .center
        containerView.layer.cornerRadius = 20
        backgroundColor = UIColor.clear
    }
    
    func updateCell(with viewModel: ResumeCellViewModel, andColor color: UIColor) {
        resumeCellViewModel = viewModel
        containerView.backgroundColor = color
        sectionDescription.text = resumeCellViewModel?.sectionDescription
    }
}
