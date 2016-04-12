//
//  InitialScreenVC.swift
//  PraQue
//
//  Created by Ludimila da Bela Cruz on 4/10/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit
import MediaPlayer


class InitialScreenVC: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var currentMessage: UILabel!
    @IBOutlet var viewParallax: UIView!
    @IBOutlet weak var initButton: UIButton!
    @IBOutlet weak var inspectLabel: UILabel!
    
    
    // AVPlayer
    var item : AVPlayerItem!
    var player : AVPlayer!
    var avLayer : AVPlayerLayer!
    
    
    // create swipe
    let swipeLeft = UISwipeGestureRecognizer()
    let swipeRight = UISwipeGestureRecognizer()
    
    let imageArray = ["BG", "TelaInicialBG","BG"]
    
    //index array
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            try playVideo()
        } catch AppError.InvalidResource(let name, let type){
            debugPrint("Could not find resource \(name).\(type)")
        } catch {
            debugPrint("Erro generico")
        }

        
     //   self.addParallax()
        self.setupGesture()
        self.setMessage(self.currentIndex)
        self.config()
        
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
        
        let messages = ["Veja as propostas dos governantes \n para qualquer cidade.","Veja quais propostas  foram aceitas\n e quanto foi repassado.", "Fiscalize se as propostas estão \nsendo colocadas em prática."]
        
        //self.imageBG.image = UIImage(named: self.imageArray[index])
        
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

    
    
    
    
    //video
    
    private func playVideo() throws {
        
        guard let path = NSBundle.mainBundle().pathForResource("praqueentrada", ofType: "mp4") else {
            throw AppError.InvalidResource("praqueentrada","mp4")
        }
        
        let pathURL = NSURL.fileURLWithPath(path)
        
        // AVPlayerItem
        self.item = AVPlayerItem(URL: pathURL)
        // AVPlayer
        self.player = AVPlayer(playerItem: self.item)
        // AVPlayerLayer
        self.avLayer = AVPlayerLayer(player: self.player)
        
        // Configurações da Layer
        self.avLayer.frame = self.view.bounds
        self.avLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.player.play()
        self.avLayer.opacity = 0.7
        self.player.volume = 0.0
        self.view.layer.addSublayer(self.avLayer)
        
        self.player.actionAtItemEnd = .None
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playerItemDidReachEnd:", name: AVPlayerItemDidPlayToEndTimeNotification, object: player.currentItem)
        
    }
    
    func playerItemDidReachEnd(notification: NSNotification) {
        player.seekToTime(kCMTimeZero)
        player.play()
        
    }
    
    enum AppError : ErrorType {
        case InvalidResource(String,String)
    }
    
    func config() {
        
        self.view.layer.zPosition = 1
        self.viewParallax.layer.zPosition = 1
        self.initButton.layer.zPosition = 10
        self.inspectLabel.layer.zPosition = 10
        self.currentMessage.layer.zPosition = 10
        
    }

    
    

}
