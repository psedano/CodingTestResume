//
//  HelloView.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/26/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import UIKit

class HelloView: XibView {
    @IBOutlet weak var initialWelcome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialWelcome.text = "Welcome to my resume"
        initialWelcome.textColor = UIColor.tangerine
        initialWelcome.font = UIFont(name: GlobalConstants.quicksandFontBold, size: 30)
        initialWelcome.numberOfLines = 0
        initialWelcome.textAlignment = .center
        backgroundColor = UIColor.moonYellow
    }
}
