//
//  CompanyNameViewController.swift
//  Welco-iOS
//
//  Created by 安部 晴彦 on 2015/11/29.
//  Copyright © 2015年 Parse. All rights reserved.
//

import Foundation
import PPSSignatureView
import Parse

class CompanyNameViewController: UIViewController {
    
    var selectedMember: PFObject?
    var visitorInfo: PFObject?

    @IBOutlet weak var companyName: PPSSignatureView!
    
    @IBAction func next(sender: UIButton) {
        if selectedMember != nil {
            self.visitorInfo = self.visitorInfo ?? PFObject(className: "VisitorInfo")
            self.visitorInfo!["member"] = self.selectedMember
        }
        Signature.save(visitorInfo: self.visitorInfo, signatureType: Signature.SignatureType.Company, uiImage: companyName.signatureImage, successCallback: nil, errorCallback: nil)
    }

    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showVisitorName" {
            let controller = (segue.destinationViewController as! UINavigationController).topViewController as! VisitorNameViewController
            controller.selectedMember = self.selectedMember
            controller.visitorInfo = self.visitorInfo
        }
    }
}