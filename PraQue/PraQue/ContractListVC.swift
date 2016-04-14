//
//  ContractListVC.swift
//  PraQue
//
//  Created by Ludimila da Bela Cruz on 4/10/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit
import MapKit
import SwiftCSV

class ContractListVC: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var map: MKMapView!

    static var fakeDB = CSV(string: "abc\nabc")
    static var selectedRow = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.map.delegate = self
        self.map.showsUserLocation = true;
        self.manageCSV()
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContractListVC.fakeDB.rows.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContractTableViewCell
        
        cell.contractName.text = ContractListVC.fakeDB.rows[indexPath.row]["NM_PROGRAMA"]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        ContractListVC.selectedRow = indexPath.row
    }
    
    
    func manageCSV(){
    
        
        let sourcePath = NSBundle.mainBundle().pathForResource("mock_data", ofType: "csv")
        
        let data = NSData(contentsOfFile: sourcePath!)
        
        
        var inputString:String! = String(data: data!, encoding: NSUTF8StringEncoding)
        inputString = inputString.stringByReplacingOccurrencesOfString("\"", withString: "")
        
        let tab = NSCharacterSet(charactersInString: ";")
        ContractListVC.fakeDB = CSV(string: inputString, delimiter: tab)
    
    
    }

}
