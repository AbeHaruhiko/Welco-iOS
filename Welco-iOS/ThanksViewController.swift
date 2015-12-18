//
//  ThanksViewController.swift
//  Welco-iOS
//
//  Created by 安部 晴彦 on 2015/12/18.
//  Copyright © 2015年 Parse. All rights reserved.
//

import Foundation
import UIKit

class ThanksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("moveToTop:"), userInfo: nil, repeats: true)
    }
    
    func moveToTop(timer: NSTimer) {
        performSegueWithIdentifier("FromThanksToTopSegue", sender: nil)
    }
}