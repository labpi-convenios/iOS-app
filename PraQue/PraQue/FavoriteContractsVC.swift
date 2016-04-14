//
//  FavoriteContractsVC.swift
//  PraQue
//
//  Created by Ludimila da Bela Cruz on 4/11/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit

class FavoriteContractsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return ContractListVC.fakeFavorites.rows.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FavoriteCell", forIndexPath: indexPath) as! FavoriteContractsTableViewCell
        
        cell.favoriteContractName.text = ContractListVC.fakeFavorites.rows[indexPath.row]["NM_PROGRAMA"]
        
        return cell
    }

}
