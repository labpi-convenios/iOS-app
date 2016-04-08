//
//  ViewController.swift
//  Pra Que?
//
//  Created by Ludimila da Bela Cruz on 4/6/16.
//  Copyright © 2016 labpi-convenios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var currentMessage: UILabel!
    
    // create swipe
    let swipeLeft = UISwipeGestureRecognizer()
    let swipeRight = UISwipeGestureRecognizer()
    
    
    
    //index array
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        let messages = ["Teste 01","Teste 02", "Teste03"]
        
        self.currentMessage.text = messages[index]
    
    }
    
}//end of class

