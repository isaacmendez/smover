//
//  AddEntryViewTransition.swift
//  Smover
//
//  Created by Laurie Gray on 28/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit

// TODO: Create Transition here
// Conform to Transitioning Delegate on both views and set the delegates to the VCs
// Test BEAST Animation FTW

class AddEntryViewTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let transitionDuration = 0.75
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(toView)
        containerView.bringSubview(toFront: toView)
        
        toView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        toView.transform = CGAffineTransform(translationX: fromView.frame.width - 300.0, y: 300.0)
        
        UIView.animate(withDuration: transitionDuration, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.2, animations: {
        toView.transform = CGAffineTransform.identity
        }){ _ in
             transitionContext.completeTransition(true)
        }
    }
}
