//
//  StartScene.swift
//  Blocos
//
//  Created by Lourenço Gomes on 12/01/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//

import SpriteKit

class StartScene: SKScene {
    
    override init(size:CGSize) {
        super.init(size: size)
        
        let blockBanner = SKLabelNode.init(text: "Blocks Adventure")
        blockBanner.fontSize = 50
        blockBanner.fontColor = SKColor.green
        blockBanner.horizontalAlignmentMode = .center
        blockBanner.position = CGPoint(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0)
        self.addChild(blockBanner)
        
        let touchLabel = SKLabelNode.init(text: "touch screen to screen")
        touchLabel.fontSize = 20
        touchLabel.fontColor = SKColor.green
        touchLabel.horizontalAlignmentMode = .center
        touchLabel.position = CGPoint(x: self.frame.size.width/2.0, y: self.frame.size.height/4.0)
        self.addChild(touchLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.crossFade(withDuration: 0.5)
        let nextScene = GameScene(size:self.frame.size)
        nextScene.scaleMode = .aspectFit
        scene?.view?.presentScene(nextScene, transition: transition)

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
