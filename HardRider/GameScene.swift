//
//  GameScene.swift
//  HardRider
//
//  Created by Paweł Tymura on 03.03.2016.
//  Copyright (c) 2016 Paweł Tymura. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let myPicture = MainGameObject(imageNamed: "Spaceship")
    
    override func didMoveToView(view:SKView) {
        /* Setup your scene here */
        self.backgroundColor = UIColor.blackColor()
        
        myPicture.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myPicture)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            //Get the location of your touch
            let touchLocation = touch.locationInNode(self)
            //Set the position of your node to that location.
            myPicture.position = touchLocation
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
    }
}
