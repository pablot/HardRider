//
//  GameScene.swift
//  HardRider
//
//  Created by Paweł Tymura on 03.03.2016.
//  Copyright (c) 2016 Paweł Tymura. All rights reserved.
//

import SpriteKit
import CoreMotion
import UIKit

class GameScene: SKScene {
    var mainscreen = UIScreen()
    
    var spaceShip = MainGameObject(imageNamed: "Spaceship")
    var sand = SKSpriteNode(imageNamed: "piasek")
    
    var motionManager = CMMotionManager()
    var dest = CGPoint(x: 0, y:0)
    
    override func didMoveToView(view:SKView) {
        self.backgroundColor = UIColor.yellowColor()
        
        
        sand.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        sand.size = CGSize(width: 1024, height: 768)
        self.addChild(sand)
        spaceShip.position = CGPoint(x: 674 /*CGRectGetMidX(self.frame)*/, y:700)
        spaceShip.size = CGSize(width: 100.0, height: 150.0)
        self.addChild(spaceShip)
       
        if motionManager.accelerometerAvailable == true {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler:{
                data, error in
                
                let currentX = self.spaceShip.position.x
                let currentY = self.spaceShip.position.y
                var change: CGFloat = 0
                
                if data!.acceleration.x != 0
                {
                    change = currentX + CGFloat(data!.acceleration.x * 100)
                    if self.mainscreen.bounds.contains(CGPoint(x: change, y: currentY)) {
                        self.dest.x = change
                    }
                }
                
                if data!.acceleration.y != 0
                {
                    change = currentY + CGFloat(data!.acceleration.y * 100)
                    if self.mainscreen.bounds.contains(CGPoint(x: currentX, y: change)) {
                        self.dest.y = change
                    }
                }
            })
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        let action = SKAction.moveTo(dest, duration:  1)
        self.spaceShip.runAction(action)
    }
}
