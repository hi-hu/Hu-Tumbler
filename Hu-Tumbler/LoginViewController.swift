//
//  LoginViewController.swift
//  Hu-Tumbler
//
//  Created by Hi_Hu on 3/8/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginForm: UIView!
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide login form and displace form position
        loginForm.alpha = 0
        loginForm.center.y = loginForm.center.y + 500
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doAnimateIn() {
        
        emailTF.becomeFirstResponder()
        
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 8, options: nil, animations: { () -> Void in
            self.loginForm.alpha = 1
            self.loginForm.center.y = self.loginForm.center.y - 500
        }) { (Bool) -> Void in
            // code
        }
    }
    
    func doAnimatOut() {
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: nil, animations: { () -> Void in
            self.loginForm.alpha = 1
            self.loginForm.center.y = self.loginForm.center.y + 500
            }) { (Bool) -> Void in
                // code
        }
    }
    
    @IBAction func cancelDidPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
