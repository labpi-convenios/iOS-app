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
        
        self.initTabBar()
        
    }
    
    
    func initTabBar(){
        
        self.tabBar.barTintColor = UIColor(red:0.25, green:0.71, blue:0.81, alpha:1.0)
        self.tabBar.tintColor = UIColor.whiteColor()
        self.selectedIndex = 1
        
        
    }
    
    func createStoryBoard(name: String, imageName: String) -> UIViewController{
        
        let storyBoard = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()
        
        storyBoard?.tabBarItem.image = UIImage(named: imageName)!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        storyBoard?.tabBarItem.title = name
        
        
        return storyBoard!
    }
    
    
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        let index = tabBar.items?.indexOf(item)
        if index == 0{
            let mapList = ContractListVC()
            presentViewController(mapList, animated: true, completion: nil)
        }
    }
        
}
