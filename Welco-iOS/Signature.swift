//
//  Sigunature.swift
//  Welco-iOS
//
//  Created by 安部 晴彦 on 2015/11/29.
//  Copyright © 2015年 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Signature {
    
    enum SignatureType {
        case Company
        case Visitor
        
        func toString() -> String {
            switch self {
                case .Company:
                    return "company"
                case .Visitor:
                    return "visitor"
            }
        }
    }
    
    static func save(visitorInfo visitorInfo: PFObject?, signatureType: SignatureType, uiImage: UIImage) {
        
        let imageData = UIImagePNGRepresentation(uiImage)
        let imageFile = PFFile(name: "signature.png", data: imageData!)
        
        // ?? は三項演算子の省略形
        let visitorInfo = visitorInfo ?? PFObject(className: "VisitorInfo")
        
        visitorInfo[signatureType.toString()] = imageFile
        visitorInfo.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }

    }
}