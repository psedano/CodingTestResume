//
//  CareerHistoryViewModel.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/26/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import Foundation

struct CareerHistoryViewModel {
    var careerHistoryModel: [CareerHistoryModel]?
    
    init(careerHistoryModel: [CareerHistoryModel]) {
        self.careerHistoryModel = careerHistoryModel
    }
}
