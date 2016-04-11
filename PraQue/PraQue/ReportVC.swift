//
//  ReportVC.swift
//  PraQue
//
//  Created by Marcelo Cristiano Araujo Silva on 10/04/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit

class ReportVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func cancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = ReportTableViewCell()
        
        switch (indexPath.row){
            
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier(self.returnIdentifier(indexPath.row), forIndexPath: indexPath) as! ReportTableViewCell
            
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier(self.returnIdentifier(indexPath.row), forIndexPath: indexPath) as! ReportTableViewCell

        case 2:
             cell = tableView.dequeueReusableCellWithIdentifier(self.returnIdentifier(indexPath.row), forIndexPath: indexPath) as! ReportTableViewCell
        default:
            print("Deu ruim na tableViewReport")
        }//fim switch
    
        return cell
    
    }
    
    
    func returnIdentifier(rowIndex: Int) -> String{
    
        var cellIdentifier = String()
        
        switch (rowIndex){
        case 0:
            cellIdentifier =  "CellContractStatus"
            self.tableView.rowHeight = 50
            
        case 1:
           cellIdentifier = "CellImage"
           self.tableView.rowHeight = 250

            
        case 2:
              cellIdentifier = "CellReport"
              self.tableView.rowHeight = 300

            
        default:
            print("Deu ruim no case do identifier")
        }
        
        return cellIdentifier
        
    }

}
