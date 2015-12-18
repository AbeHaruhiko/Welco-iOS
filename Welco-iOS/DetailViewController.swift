//
//  DetailViewController.swift
//  try
//
//  Created by 安部 晴彦 on 2015/11/21.
//  Copyright © 2015年 安部 晴彦. All rights reserved.
//

import UIKit
import Parse
import AVFoundation

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    private var alarmAudioPlayer: AVAudioPlayer?


    var selectedMember: PFObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let selectedMember: PFObject = self.selectedMember {
            if let label = self.detailDescriptionLabel {
                label.text = (selectedMember["name"] as? String)! + "とご面会ですね？"
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
        
        self.prepareSound("se_maoudamashii_chime10")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showCompanyName" {
            let object = self.selectedMember
            let controller = (segue.destinationViewController as! UINavigationController).topViewController as! CompanyNameViewController
            controller.selectedMember = object
        }
    }
    
    @IBAction func next() {
        playSound()
    }
    
    func prepareSound(nameOfAudioFileInAssetCatalog: String) {
        if let sound = NSDataAsset(name: nameOfAudioFileInAssetCatalog) {
            do {
                try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try! AVAudioSession.sharedInstance().setActive(true)
                try alarmAudioPlayer = AVAudioPlayer(data: sound.data, fileTypeHint: "wav")
            } catch {
                print("error initializing AVAudioPlayer")
            }
        }
    }

    func playSound() {
        alarmAudioPlayer!.play()
    }
}

