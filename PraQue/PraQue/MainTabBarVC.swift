//
//  MainTabBarVC.swift
//  PraQue
//  Created by Ludimila da Bela Cruz on 4/10/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        tabBar.backgroundColor = UIColor.whiteColor()
        let index = tabBar.items?.indexOf(item)
        if index == 0{
            let mapList = ContractListVC()
            presentViewController(mapList, animated: true, completion: nil)
        }
    }
        
}
