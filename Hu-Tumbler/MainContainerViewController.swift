//
//  MainContainerViewController.swift
//  Hu-Tumbler
//
//  Created by Hi_Hu on 3/6/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class MainContainerViewController: UIViewController {

    
    @IBOutlet weak var mainContainerVC: UIView!
    
    // array of tab controller buttons
    @IBOutlet var tabControlButtons: [UIButton]!
    
    // array holding the views
    var vcArray = [UIViewController]()
    var homeVC: HomeViewController!
    var searchVC: TrendingViewController!
    var composeVC: ComposeViewController!
    var accountVC: AccountViewController!
    var activityVC: SearchViewController!
    
    // index defaulted to home
    var selectedIndex: Int! = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        // view controller instantiation
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeVC = storyboard.instantiateViewControllerWithIdentifier("homeSBID") as HomeViewController
        searchVC = storyboard.instantiateViewControllerWithIdentifier("trendingSBID") as TrendingViewController
        composeVC = storyboard.instantiateViewControllerWithIdentifier("composeSBID") as ComposeViewController
        accountVC = storyboard.instantiateViewControllerWithIdentifier("accountSBID") as AccountViewController
        activityVC = storyboard.instantiateViewControllerWithIdentifier("searchSBID") as SearchViewController
        
        // add the instantiated views into the array
        vcArray = [homeVC, searchVC, composeVC, accountVC, activityVC]
        
        // default to homepage
        displayContentController(homeVC)
        tabControlButtons[0].selected = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tabBtnDidPress(sender: AnyObject) {
        
        // current view
        var selectedVC = vcArray[selectedIndex]
        tabControlButtons[selectedIndex].selected = false
        
        // remove current view
        hideContentController(selectedVC)
        
        // add new view
        selectedIndex = sender.tag
        displayContentController(vcArray[selectedIndex])
        tabControlButtons[selectedIndex].selected = true
    }

    func displayContentController(content: UIViewController) {
        addChildViewController(content)
        mainContainerVC.addSubview(content.view)
        content.didMoveToParentViewController(self)
    }
    
    func hideContentController(content: UIViewController) {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
