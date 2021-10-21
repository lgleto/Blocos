//
//  VictoryScene.swift
//  Blocos
//
//  Created by Lourenço Gomes on 12/01/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//

import SpriteKit

class VictoryScene: SKScene {
    
    override init(size:CGSize) {
        super.init(size: size)
        
        let gameOverBanner = SKLabelNode.init(text: "You are the best")
        gameOverBanner.fontSize = 50
        gameOverBanner.fontColor = SKColor.green
        gameOverBanner.horizontalAlignmentMode = .center
        gameOverBanner.position = CGPoint(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0)
        self.addChild(gameOverBanner)
        
        let touchLabel = SKLabelNode.init(text: "touch screen to restart")
        touchLabel.fontSize = 20
        touchLabel.fontColor = SKColor.green
        touchLabel.horizontalAlignmentMode = .center
        touchLabel.position = CGPoint(x: self.frame.size.width/2.0, y: self.frame.size.height/4.0)
        self.addChild(touchLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
        let nextScene = StartScene(size:self.frame.size)
        nextScene.scaleMode = .aspectFit
        scene?.view?.presentScene(nextScene, transition: transition)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

