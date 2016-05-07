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
        
        spaceShip.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        spaceShip.size = CGSize(width: 100.0, height: 150.0)
        self.addChild(spaceShip)
        sand.position = CGPoint(x:300, y:0)
        self.addChild(sand)
        text.position = CGPoint(x: 500, y: 0)
        text.fontColor = UIColor.blackColor()
        text.fontSize = 20
        self.addChild(text)
        text2.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        text2.fontColor = UIColor.blackColor()
        text2.fontSize = 20
        self.addChild(text2)
        
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
        //let action = SKAction.moveToX(destX, duration: 1)
        //self.spaceShip.runAction(action)
        sand.position = CGPoint(x: sand.position.x + 1, y: sand.position.y + 1)
        text.text = "wysokość:  \(self.frame.height); szerokość: \(self.frame.width)"
        text2.text = "\(CGRectGetMidY(self.frame)) ; \(CGRectGetMidX(self.frame))"
    }
}
