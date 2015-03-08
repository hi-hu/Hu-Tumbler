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
    
    // custom transition
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // set the status bar style to light
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        // view controller instantiation
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeVC = storyboard.instantiateViewControllerWithIdentifier("homeSBID") as HomeViewController
        searchVC = storyboard.instantiateViewControllerWithIdentifier("trendingSBID") as TrendingViewController
        composeVC = storyboard.instantiateViewControllerWithIdentifier("composeSBID") as ComposeViewController
        accountVC = storyboard.instantiateViewControllerWithIdentifier("accountSBID") as AccountViewController
        activityVC = storyboard.instantiateViewControllerWithIdentifier("searchSBID") as SearchViewController
        
        // add the instantiated views into the array
        vcArray = [homeVC, searchVC, accountVC, activityVC]
        
        // default to homepage
        displayContentController(mainContainerVC, content: homeVC)
        tabControlButtons[0].selected = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tabBtnDidPress(sender: AnyObject) {
        
        var oldIndex = selectedIndex
        selectedIndex = sender.tag
        
        // deactivate button  and remove current view
        tabControlButtons[oldIndex].selected = false
        hideContentController(mainContainerVC, content: vcArray[oldIndex])
        
        // activate button add new selected view
        tabControlButtons[selectedIndex].selected = true
        displayContentController(mainContainerVC, content: vcArray[selectedIndex])
    }

    @IBAction func composeDidPress(sender: AnyObject) {
        
        
        performSegueWithIdentifier("composeSegue", sender: self)

    }

    func displayContentController(container: UIView, content: UIViewController) {
        addChildViewController(content)
        mainContainerVC.addSubview(content.view)
        content.didMoveToParentViewController(self)
    }
    
    func hideContentController(container: UIView, content: UIViewController) {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    // MARK: - Navigation


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        var destinationViewController = segue.destinationViewController as ComposeViewController

        fadeTransition = FadeTransition()
        fadeTransition.duration = 0.3
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = fadeTransition
    }

}
