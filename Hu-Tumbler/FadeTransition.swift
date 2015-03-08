//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var composeView = toViewController as ComposeViewController
        
        composeView.view.alpha = 0
        composeView.doAnimate(true)
        
        UIView.animateWithDuration(duration, animations: {
            composeView.view.alpha = 1
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var composeView = fromViewController as ComposeViewController
        
        composeView.view.alpha = 1
        composeView.doAnimate(false)
        
        UIView.animateWithDuration(0.8, animations: {
            composeView.view.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}
