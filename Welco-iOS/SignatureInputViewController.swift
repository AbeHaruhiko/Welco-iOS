//
//  SignatureInputViewController.swift
//  Welco-iOS
//
//  Created by 安部 晴彦 on 2015/11/25.
//  Copyright © 2015年 Parse. All rights reserved.
//

import Foundation
import PPSSignatureView

class SignatureInputViewController: UIViewController {
    
    @IBAction func next(sender: UIButton) {
        self.performSegueWithIdentifier("PushToUserNameInputSegue", sender: UIButton())
    }
}