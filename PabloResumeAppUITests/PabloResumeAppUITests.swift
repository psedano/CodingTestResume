//
//  PabloResumeAppUITests.swift
//  PabloResumeAppUITests
//
//  Created by Pablo Sedano on 7/25/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import XCTest

class PabloResumeAppUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigation() {
        let app = XCUIApplication()
        let careerSummaryOption = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Career Summary"]/*[[".cells.staticTexts[\"Career Summary\"]",".staticTexts[\"Career Summary\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let backButton = app.buttons["backIcon"]
        let headerText = app.staticTexts["I'm Pablo and I'm a Software Developer!"]
        
        careerSummaryOption.tap()
        XCTAssertTrue(backButton.exists)
        XCTAssertFalse(careerSummaryOption.exists)
        XCTAssertFalse(headerText.exists)
    }
    
    func testTableViewScroll() {
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Career Summary"]/*[[".cells.staticTexts[\"Career Summary\"]",".staticTexts[\"Career Summary\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Languages"]/*[[".cells.staticTexts[\"Languages\"]",".staticTexts[\"Languages\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
    }

}
