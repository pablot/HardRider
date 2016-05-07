//
//  GameScene.swift
//  HardRider
//
//  Created by Paweł Tymura on 03.03.2016.
//  Copyright (c) 2016 Paweł Tymura. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    var spaceShip = MainGameObject(imageNamed: "Spaceship")
    var sand = SKSpriteNode(imageNamed: "piasek")
    var text = SKLabelNode()
    var text2 = SKLabelNode()
    
    var motionManager = CMMotionManager()
    var destX:CGFloat  = 0.0
    
    override func didMoveToView(view:SKView) {
        self.backgroundColor = UIColor.yellowColor()
        
        sand.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        sand.size = CGSize(width: 1024, height: 768)
        self.addChild(sand)
        spaceShip.position = CGPoint(x:CGRectGetMidX(self.frame), y:80)
        spaceShip.size = CGSize(width: 100.0, height: 150.0)
        self.addChild(spaceShip)
       
        if motionManager.accelerometerAvailable == true {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler:{
                data, error in
                
                let currentX = self.spaceShip.position.x
                
                if data!.acceleration.x < 0 {
                    self.destX = currentX + CGFloat(data!.acceleration.x * 100)
                }
                    
                else if data!.acceleration.x > 0 {
                    self.destX = currentX + CGFloat(data!.acceleration.x * 100)
                }
                
            })
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        let action = SKAction.moveToX(destX, duration: 1)
        self.spaceShip.runAction(action)
    }
}
