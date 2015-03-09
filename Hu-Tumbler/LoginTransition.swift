//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class LoginTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var loginVC = toViewController as LoginViewController
        
        loginVC.view.alpha = 0
        loginVC.doAnimateIn()
        
        UIView.animateWithDuration(duration, animations: {
            loginVC.view.alpha = 1
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var loginVC = fromViewController as LoginViewController

        loginVC.view.alpha = 1
        loginVC.doAnimatOut()
        
        UIView.animateWithDuration(duration, animations: {
            loginVC.view.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}
