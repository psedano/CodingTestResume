import Foundation
import UIKit

public extension UIView {
    
    func setup(constraints: String, to views: [String : UIView], options: NSLayoutConstraint.FormatOptions = [], with metrics: [String : Any]? = nil) {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: constraints, options: options, metrics: metrics, views: views))
    }
    
    func addConstraintsToFit(view: UIView) {
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                 options: NSLayoutConstraint.FormatOptions(),
                                                                 metrics: nil,
                                                                 views: ["view": view])
        addConstraints(verticalConstraints)
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                   options: NSLayoutConstraint.FormatOptions(),
                                                                   metrics: nil,
                                                                   views: ["view": view])
        addConstraints(horizontalConstraints)
    }
    
    func centerHorizontally(toItem view: UIView, offset: Float = 0) {
        let centerConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: CGFloat(offset))
        NSLayoutConstraint.activate([centerConstraint])
    }
    
    func centerVertically(toItem view: UIView, offset: Float = 0) {
        let constraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: CGFloat(offset))
        NSLayoutConstraint.activate([constraint])
    }
    
    func addConstraintFixedWidth(_ width: Float) {
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(width))
        NSLayoutConstraint.activate([constraint])
    }
    
    func addConstraintFixedHeight(_ height: Float) {
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(height))
        NSLayoutConstraint.activate([constraint])
    }
    
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraintsToFit(view: self)
    }
    
}
