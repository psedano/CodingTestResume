//
//  ViewController.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/25/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var resumeSections: UITableView!
    @IBOutlet weak var helloView: HelloView!
    var sectionArray = [String]()
    var sectionDetail = [String]()
    typealias constants = HomeConstants
    let transition = TransitionAnimation()
    var careerHistory = [CareerHistoryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        let networkHelper = NetworkHelper()
        networkHelper.requestFromService { [unowned self] homeModel in
            let headerViewViewModel = HeaderViewViewModel(profileImgName: homeModel.profileImgName, welcomeMessage: homeModel.welcomeMessage)
            for career in homeModel.careerHistory {
                let singleCareer = CareerHistoryModel(title: career.title,
                                                   dates: career.dates,
                                                   position: career.position,
                                                   jobDescription: career.jobDescription)
                self.careerHistory.append(singleCareer)
            }
            self.sectionArray = homeModel.sectionArray
            self.sectionDetail = homeModel.sectionDetails
            self.headerView.update(with: headerViewViewModel)
            self.setupUI()
        }
    }
    
    func setupUI() {
        UIView.animate(withDuration: 0.5, delay: 1.0, options: .curveEaseIn, animations: {
            self.helloView.alpha = 0.0
        }, completion: nil)

        let nib = UINib(nibName: constants.resumeCellID, bundle: nil)
        resumeSections.register(nib, forCellReuseIdentifier: constants.resumeCellID)
        resumeSections.dataSource = self
        resumeSections.delegate = self
        resumeSections.reloadData()
        resumeSections.backgroundColor = UIColor.clear
        resumeSections.separatorColor = UIColor.clear
        resumeSections.showsVerticalScrollIndicator = false
        view.backgroundColor = UIColor.white
        navigationController?.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resumeCellViewModel = ResumeCellViewModel(sectionDescription: sectionArray[indexPath.row])
        let resumeCell = tableView.dequeueReusableCell(withIdentifier: constants.resumeCellID) as! ResumeCell
        resumeCell.updateCell(with: resumeCellViewModel, andColor: GlobalConstants.arrayColors[indexPath.row])
        return resumeCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ResumeCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if sectionArray[indexPath.row] == constants.careerHistoryID {
            let careerHistoryVC = CareerHistoryViewController(nibName: constants.careerHistoryViewControllerID, bundle: nil)
            let careerHistoryViewModel = CareerHistoryViewModel(careerHistoryModel: careerHistory)
            careerHistoryVC.update(with: careerHistoryViewModel)
            navigationController?.pushViewController(careerHistoryVC, animated: true)
            return
        }
        
        let detailViewController = DetailViewController(nibName: constants.detailViewControllerID, bundle: nil)
        let detailModel = DetailModel(detail: sectionDetail[indexPath.row])
        detailViewController.detailViewModel = DetailViewViewModel(detailModel: detailModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension HomeViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationHelpers.executeTransition(animationControllerFor: operation, resumeSections, transition)
    }
}

