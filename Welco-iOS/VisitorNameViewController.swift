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

    var selectedMember: PFObject?
    var visitorInfo: PFObject?

    @IBOutlet weak var visitorName: PPSSignatureView!
    
    @IBAction func next(sender: UIButton) {
        
        // 通知を行うクロージャ
        let sendNotification: Void -> Void = {
            let push = PFPush()
//            push.setChannel(self.selectedMember?.objectId)
            
            let memberName = ((self.selectedMember?.objectForKey("name")) != nil) ? ((self.selectedMember?.objectForKey("name"))! as! String) + "さんに" : ""
            push.setMessage(memberName + "来客です。")
            push.sendPushInBackground()
        }
        
        Signature.save(visitorInfo: self.visitorInfo, signatureType: Signature.SignatureType.Visitor, uiImage: visitorName.signatureImage, successCallback: sendNotification, errorCallback: nil)
    }
 }