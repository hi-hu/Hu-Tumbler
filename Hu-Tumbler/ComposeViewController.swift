//
//  ComposeViewController.swift
//  Hu-Tumbler
//
//  Created by Hi_Hu on 3/6/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textBtn: UIButton!
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var quoteBtn: UIButton!
    @IBOutlet weak var linkBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!
    
    var buttonOrigin = [140, 260]
    
    var btnArray = [UIButton]()
    var delayArray = [0.22, 0.0, 0.2, 0.25, 0.1, 0.3]
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        btnArray = [textBtn, photoBtn, quoteBtn, linkBtn, chatBtn, videoBtn]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // offset y positions to below the view
    func resetButtons() {
        for var index = 0; index < btnArray.count; index++ {
            
            var btn = btnArray[index]
            
            // set the position Y of the buttons based on row
            if index < 3 {
                btn.frame.origin.y = CGFloat(buttonOrigin[0]) + self.view.frame.height
            } else {
                btn.frame.origin.y = CGFloat(buttonOrigin[1]) + self.view.frame.height
            }
            
        }
    }
    
    func doAnimate(animateIn: Bool) {
        
        if animateIn {
            resetButtons()
        }

        for var index = 0; index < btnArray.count; index++ {
            
            var delay = delayArray[index]
            var btn = btnArray[index]

            UIView.animateWithDuration(0.5, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: nil, animations: { () -> Void in

                // check to see if animating direction is IN
                if animateIn {
                    btn.frame.origin.y = btn.frame.origin.y - self.view.frame.height
                } else {
                    btn.frame.origin.y = btn.frame.origin.y - self.view.frame.height / 1.6
                }

            }) { (Bool) -> Void in
                // do nothing upon completion
            }
        }
    }
    
    // will be overridden by custom dismiss
    @IBAction func dismissDidPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
