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
        let text = SKLabelNode(text: "    \(mainscreen.bounds.maxX)")
        text.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        text.color = SKColor.blackColor()
        self.addChild(text)
        spaceShip.position = CGPoint(x: 674 /*CGRectGetMidX(self.frame)*/, y:700)
        spaceShip.size = CGSize(width: 100.0, height: 150.0)
        self.addChild(spaceShip)
       
        if motionManager.accelerometerAvailable == true {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler:{
                data, error in
                
                let currentX = self.spaceShip.position.x
                let currentY = self.spaceShip.position.y
                
                if data!.acceleration.x < 0 && currentX > self.mainscreen.bounds.minX {
                    self.dest.x = currentX + CGFloat(data!.acceleration.x * 100)
                }
                    
                else if data!.acceleration.x > 0 && currentX <  {
                    self.dest.x = currentX + CGFloat(data!.acceleration.x * 100)
                }
                
                if data!.acceleration.y < 0 && currentY > self.mainscreen.bounds.minY {
                    self.dest.y = currentY + CGFloat(data!.acceleration.y * 100)
                }
                    
                else if data!.acceleration.y > 0 && currentY < self.mainscreen.bounds.maxY {
                    self.dest.y = currentY + CGFloat(data!.acceleration.y * 100)
                }
            })
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        let action = SKAction.moveTo(dest, duration:  1)
        self.spaceShip.runAction(action)
    }
}
