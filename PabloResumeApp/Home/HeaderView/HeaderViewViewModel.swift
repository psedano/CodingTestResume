//
//  HeaderViewViewModel.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/25/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import Foundation

public struct HeaderViewViewModel {
    public let profileImgName: String
    public let welcomeMessage: String
    
    public init(profileImgName: String, welcomeMessage: String) {
        self.profileImgName = profileImgName
        self.welcomeMessage = welcomeMessage
    }
}
