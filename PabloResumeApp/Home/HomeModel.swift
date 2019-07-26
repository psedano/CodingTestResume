//
//  HomeModel.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/25/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import Foundation

struct HomeModel: Codable {
    var welcomeMessage: String
    var profileImgName: String
    var sectionArray: [String]
    var sectionDetails: [String]
    var careerHistory: [CareerHistory]
    
    struct CareerHistory: Codable {
        var title: String
        var dates: String
        var position: String
        var jobDescription: String
    }
}
