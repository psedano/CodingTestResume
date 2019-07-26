//
//  HeaderView.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/25/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import UIKit

class HeaderView: XibView {
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var welcomeMessage: UILabel!
    
    private var headerViewViewModel: HeaderViewViewModel?
    typealias constants = HeaderViewConstants
    
    func update(with viewModel: HeaderViewViewModel) {
        self.headerViewViewModel = viewModel
        guard let headerViewModel = headerViewViewModel else { return }
        profilePicture.image = UIImage(named: headerViewModel.profileImgName)
        welcomeMessage.text = headerViewModel.welcomeMessage
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        welcomeMessage.numberOfLines = 0
        profilePicture.layer.cornerRadius = profilePicture.frame.width / 2
        welcomeMessage.font = UIFont(name: GlobalConstants.quicksandFontBold, size: 20)
        welcomeMessage.textAlignment = .center
        welcomeMessage.textColor = UIColor.white
        view?.backgroundColor = UIColor.tangerine
    }
}
