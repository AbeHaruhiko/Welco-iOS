//
//  MasterViewController.swift
//  Welco-iOS
//
//  Created by 安部 晴彦 on 2015/11/21.
//  Copyright © 2015年 安部 晴彦. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class MasterViewController: PFQueryTableViewController {

    var detailViewController: DetailViewController? = nil

    // MARK: Init
    
//    convenience init(className: String?) {
//        self.init(style: .Plain, className: className)
//        
//        title = "Member"
//        pullToRefreshEnabled = true
//        paginationEnabled = false
//        placeholderImage = UIImage(named: "placeholder")
//    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //Use the Parse built-in user class
        self.parseClassName = "Member"
        
        //This is a custom column in the user class.
        self.textKey = "name"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.imageKey = "photo"
    }

    // MARK: Data
    
    override func queryForTable() -> PFQuery {
        return super.queryForTable().orderByAscending("dispOrder").includeKey("post")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = self.objects?[indexPath.row] as! PFObject
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.selectedMember = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: TableView
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
//        let cellIdentifier = "cell"
//        
//        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell
//        if cell == nil {
//            cell = PFTableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
//        }
//        
//        cell?.textLabel?.text = object?["name"] as? String
//        
//        //        var subtitle: String
//        //        if let priority = object?["priority"] as? Int {
//        //            subtitle = "Priority: \(priority)"
//        //        } else {
//        //            subtitle = "No Priority"
//        //        }
//        //        cell?.detailTextLabel?.text = subtitle
//        
//        return cell
//    }
    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.objects!.count
//    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = self.objects![indexPath.row] as! PFObject
        cell.textLabel!.text = (object.objectForKey("post") as! PFObject).objectForKey("name") as! String
        cell.detailTextLabel!.text = object.objectForKey("name") as! String
        cell.textLabel?.font = UIFont.systemFontOfSize(11)
        cell.detailTextLabel?.font = UIFont.systemFontOfSize(17)
        return cell
    }

//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }

//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            self.objects.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }


}

