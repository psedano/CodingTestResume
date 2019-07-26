//
//  BackButton.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/26/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import UIKit

class BackButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        setTitle("", for: .normal)
        setImage(UIImage(named: "backIcon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        tintColor = UIColor.white
        backgroundColor = UIColor.richElectricBlue
        layer.cornerRadius = frame.width / 2
    }
}
