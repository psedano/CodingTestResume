//
//  CareerHistoryModel.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/26/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import Foundation

struct CareerHistoryModel {
    var title: String
    var dates: String
    var position: String
    var jobDescription: String
    
    init(title: String, dates: String, position: String, jobDescription: String) {
        self.title = title
        self.dates = dates
        self.position = position
        self.jobDescription = jobDescription
    }
}
