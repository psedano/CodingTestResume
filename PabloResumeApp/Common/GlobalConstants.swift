//
//  GlobalConstants.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/25/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import UIKit

struct GlobalConstants {
    static let url = "https://gist.github.com/psedano/57c2f0bfbb7d585ce72b04fafc0dcbb3/raw/99567f3b69179ae7790053b88620a44336fea43a/personalresumeinfo.json"
    static let quicksandFont = "Quicksand-Regular"
    static let quicksandFontMedium = "Quicksand-Medium"
    static let quicksandFontLight = "Quicksand-Light"
    static let quicksandFontBold = "Quicksand-Bold"
    static let arrayColors = [UIColor.shamrock,
                              UIColor.bittersweet,
                              UIColor.cerulean,
                              UIColor.mountainMajesty]
}

enum HttpMethods: String {
    case POST, GET
}

extension HttpMethods: RawRepresentable {
    typealias RawValue = String
    
    var rawValue: RawValue {
        switch self {
        case .GET: return "GET"
        case .POST: return "POST"
        }
    }
}
