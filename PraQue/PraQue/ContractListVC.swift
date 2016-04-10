//
//  ContractListVC.swift
//  PraQue
//
//  Created by Ludimila da Bela Cruz on 4/10/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit
import MapKit

class ContractListVC: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var map: MKMapView!
    
    // Array de testes
    var convenios = ["a", "b", "c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.map.delegate = self
        self.map.showsUserLocation = true;
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return convenios.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContractTableViewCell
        
        cell.contractName.text = convenios[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailViewController = ContractDetailVC()
        presentViewController(detailViewController, animated: true, completion: nil)
    }


}
