//
//  PabloResumeAppTests.swift
//  PabloResumeAppTests
//
//  Created by Pablo Sedano on 7/25/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import XCTest
@testable import PabloResumeApp

class PabloResumeAppTests: XCTestCase {
    var sut: HomeModel!
    var session: URLSession!

    override func setUp() {
        super.setUp()
        let history = [HomeModel.CareerHistory(title: "One", dates: "date1", position: "position1", jobDescription: "description1"),
                       HomeModel.CareerHistory(title: "Two", dates: "date2", position: "position2", jobDescription: "description2")]
        sut = HomeModel(welcomeMessage: "Hello", profileImgName: "profilePic", sectionArray: ["One", "Two"], sectionDetails: ["Three"], careerHistory: history)
        session = URLSession(configuration: .default)
    }
    
    func testHomeModel() {
        XCTAssertEqual(sut.welcomeMessage, "Hello")
    }
    
    func testValidateServiceRequest() {
        let url = URL(string: "https://gist.githubusercontent.com/psedano/57c2f0bfbb7d585ce72b04fafc0dcbb3/raw/99567f3b69179ae7790053b88620a44336fea43a/personalresumeinfo.json")
        let promise = expectation(description: "Status code: 200")
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
    }
    
    func testHomeViewController() {
        let bundle = Bundle(for: HomeViewController.self)
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: bundle)
        let navigationController = UINavigationController(rootViewController: homeViewController)
        
        UIApplication.shared.keyWindow?.rootViewController = homeViewController
        XCTAssertNotNil(homeViewController.view)
        XCTAssertNotNil(navigationController.view)
    }
    
    func testBackButton() {
        let bundle = Bundle(for: DetailViewController.self)
        let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: bundle)
        
        let backButton = BackButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        detailViewController.view.addSubview(backButton)
        
        UIApplication.shared.keyWindow?.rootViewController = detailViewController
        
        backButton.awakeFromNib()
        
        XCTAssertNotNil(detailViewController.view)
        XCTAssertNotNil(backButton)
    }
    
    func testCareerHistoryModel() {
        let careerHistoryModel = [CareerHistoryModel(title: "title", dates: "dates", position: "position", jobDescription: "jobDescription")]
        let careerHistoryViewModel = CareerHistoryViewModel(careerHistoryModel: careerHistoryModel)
        XCTAssertEqual(careerHistoryViewModel.careerHistoryModel?.first?.title, "title")
    }
    
    func testCareerViewController() {
        let bundle = Bundle(for: CareerHistoryViewController.self)
        let careerHistoryController = CareerHistoryViewController(nibName: "CareerHistoryViewController", bundle: bundle)
        let navigationController = UINavigationController(rootViewController: careerHistoryController)
        
        UIApplication.shared.keyWindow?.rootViewController = careerHistoryController
        var arrayModel = [CareerHistoryModel]()
        
        for i in 0..<20 {
            let careerHistoryModel = CareerHistoryModel(title: "title\(i)", dates: "dates\(i)", position: "position\(i)", jobDescription: "jobDescription\(i)")
            arrayModel.append(careerHistoryModel)
        }
        
        careerHistoryController.careerViewModel = CareerHistoryViewModel(careerHistoryModel: arrayModel)
        careerHistoryController.historyTable.reloadData()
        
        XCTAssertEqual(careerHistoryController.historyTable.numberOfRows(inSection: 0), 20)
        XCTAssertNotNil(careerHistoryController.view)
        XCTAssertNotNil(navigationController.view)
    }
    
    func testCareerCell() {
        let careerCell = UINib(nibName: "CareerCell", bundle: nil).instantiate(withOwner: nil, options: nil).first as? CareerCell
        guard let cell = careerCell else {
            XCTFail("Career Cell cannot be created")
            return
        }
        let careerHistoryModel = CareerHistoryModel(title: "title", dates: "dates", position: "position", jobDescription: "jobDescription")
        cell.updateCell(with: careerHistoryModel)
        
        XCTAssertEqual(cell.title.text, "title")
        XCTAssertEqual(cell.dates.text, "dates")
        XCTAssertEqual(cell.position.text, "position")
        XCTAssertEqual(cell.jobDescription.text, "jobDescription")
    }

    override func tearDown() {
        sut = nil
        session = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
