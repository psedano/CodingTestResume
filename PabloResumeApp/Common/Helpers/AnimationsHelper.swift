//
//  AnimationsHelper.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/25/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import UIKit

struct AnimationHelpers {
    static func executeTransition(animationControllerFor operation: UINavigationController.Operation, _ resumeSections: UITableView, _ transition: TransitionAnimation) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            guard
                let selectedIndexPathCell = resumeSections.indexPathForSelectedRow,
                let selectedCell = resumeSections.cellForRow(at: selectedIndexPathCell)
                    as? ResumeCell,
                let selectedCellSuperview = selectedCell.superview
                else {
                    return nil
            }
            
            transition.originFrame = selectedCellSuperview.convert(selectedCell.frame, to: nil)
            transition.originFrame = CGRect(
                x: transition.originFrame.origin.x + 20,
                y: transition.originFrame.origin.y + 20,
                width: transition.originFrame.size.width - 40,
                height: transition.originFrame.size.height - 40
            )
            
            transition.presenting = true
            return transition
        }
        
        return nil
    }
}
