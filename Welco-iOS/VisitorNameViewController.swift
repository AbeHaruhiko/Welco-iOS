//
//  VisitorNameViewController.swift
//  Welco-iOS
//
//  Created by 安部 晴彦 on 2015/11/29.
//  Copyright © 2015年 Parse. All rights reserved.
//

import Foundation
import PPSSignatureView
import Parse

class VisitorNameViewController: UIViewController {

    var visitorInfo: PFObject?

    @IBOutlet weak var visitorName: PPSSignatureView!
    
    @IBAction func next(sender: UIButton) {
        Signature.save(visitorInfo: self.visitorInfo, signatureType: Signature.SignatureType.Visitor, uiImage: visitorName.signatureImage)
    }
}