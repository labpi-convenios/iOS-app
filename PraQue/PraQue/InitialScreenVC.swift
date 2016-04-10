//
//  InitialScreenVC.swift
//  PraQue
//
//  Created by Ludimila da Bela Cruz on 4/10/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit

class InitialScreenVC: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var currentMessage: UILabel!
    @IBOutlet var viewParallax: UIView!
    
    // create swipe
    let swipeLeft = UISwipeGestureRecognizer()
    let swipeRight = UISwipeGestureRecognizer()
    
    
    
    //index array
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addParallax()
        self.setupGesture()
        self.setMessage(self.currentIndex)
        
    }
    
    
    //configure gesture
    func setupGesture(){
        
        self.swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        
        self.swipeLeft.addTarget(self, action: "swipeLeft:")
        self.swipeRight.addTarget(self, action: "swipeRight:")
        
        self.view.addGestureRecognizer(self.swipeLeft)
        self.view.addGestureRecognizer(self.swipeRight)
        
    }
    
    
    func swipeLeft(gesture: UISwipeGestureRecognizer){
        
        if pageControl.currentPage < 2  {
            self.currentIndex += 1
            self.pageControl.currentPage += 1
            self.setMessage(self.currentIndex)
        }
        
    }
    
    func swipeRight(gesture: UISwipeGestureRecognizer){
        
        if self.pageControl.currentPage != 0 {
            self.currentIndex -= 1
            self.pageControl.currentPage -= 1
            self.setMessage(self.currentIndex)
            
        }
    }
    
    
    //current message in label
    
    func setMessage(index: Int){
        print(index)
        
        let messages = ["Teste 01","Teste 02", "Teste 03"]
        
        self.currentMessage.text = messages[index]
        
    }
    
    
    
    func addParallax() {
        
        // Set vertical effect
        
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
            type: .TiltAlongVerticalAxis)
        
        let parallaxMotion = 20
        verticalMotionEffect.minimumRelativeValue = -(parallaxMotion)
        
        verticalMotionEffect.maximumRelativeValue = parallaxMotion
        
        
        
        // Set horizontal effect
        
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
            
            type: .TiltAlongHorizontalAxis)
        
        horizontalMotionEffect.minimumRelativeValue = -(parallaxMotion)
        
        horizontalMotionEffect.maximumRelativeValue = parallaxMotion
        
        
        
        // Create group to combine both
        
        let group = UIMotionEffectGroup()
        
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        
        
        // Add both effects to your view
        self.viewParallax.addMotionEffect(group)
        
    }


}
