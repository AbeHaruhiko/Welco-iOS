//
//  DetailViewController.swift
//  try
//
//  Created by 安部 晴彦 on 2015/11/21.
//  Copyright © 2015年 安部 晴彦. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: PFObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: PFObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = (detail["name"] as? String)! + "とご面会ですね？"
            }
        } else {
            if let label = self.detailDescriptionLabel {
                label.text = "いらしゃいませ。\nご面会予定の社員を選択してください。"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

