//
//  GameScene.swift
//  HardRider
//
//  Created by Paweł Tymura on 03.03.2016.
//  Copyright (c) 2016 Paweł Tymura. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var myPicture = MainGameObject(imageNamed: "Spaceship")
    
    override func didMoveToView(view:SKView) {
        /* Setup your scene here */
        self.backgroundColor = UIColor.blackColor()
        
        myPicture.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myPicture)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            if (myPicture.position == touch.locationInNode(self)){
                myPicture.touchId = touch.publicID
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            if myPicture.touchId == touch.publicID
            {
                myPicture.position = touch.locationInNode(self)
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            if myPicture.touchId == touch.publicID
            {
                myPicture.touchId = nil
            }
        }
     }
    
    override func update(currentTime: CFTimeInterval) {
    }
}
