//
//  TrendingViewController.swift
//  Hu-Tumbler
//
//  Created by Hi_Hu on 3/6/15.
//  Copyright (c) 2015 hi_hu. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {
    
    
    @IBOutlet weak var trendingSV: UIScrollView!
    @IBOutlet weak var trendingFeedImage: UIImageView!

    @IBOutlet weak var loadingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        trendingSV.contentSize = trendingFeedImage.frame.size
        trendingSV.alpha = 0
        
        // display loading iamge
        var images = UIImage.animatedImageNamed("loading_", duration: 3.0)
        loadingImage.image = images
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // delay the reveal of feed
    override func viewDidAppear (animated: Bool) {
        delay(10.0, { () -> () in
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.loadingImage.alpha = 0
                self.trendingSV.alpha = 1
            })
        })
    }
}
