//
//  GameScene.swift
//  Blocos
//
//  Created by Lourenço Gomes on 04/01/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let kPaddleName : String = "paddle"
    let kBallName   : String = "ball"
    
    let ballCategory    : UInt32 = 0b0001
    let bottomCategory  : UInt32 = 0b0010
    let paddleCategory  : UInt32 = 0b0100

    override init(size:CGSize) {
        super.init(size: size)
        
        let worldBorder = SKPhysicsBody.init(edgeLoopFrom: self.frame)
        worldBorder.restitution = 0.0
        worldBorder.friction = 0.0
        self.physicsBody = worldBorder
        self.physicsWorld.gravity=CGVector(dx: 0.0, dy: 0.0)
        self.physicsWorld.contactDelegate=self
        
        let bottomRect = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: 1.0)
        
        let bottom = SKNode()
        bottom.physicsBody = SKPhysicsBody(edgeLoopFrom: bottomRect)
        bottom.physicsBody?.categoryBitMask = bottomCategory
        self.addChild(bottom)
        
        let paddle = SKShapeNode.init(rect: CGRect(x: 0, y: 0, width: 120.0, height: 20))
        paddle.name=kPaddleName
        paddle.fillColor=SKColor.brown
        paddle.position = CGPoint(x: self.frame.width/2.0 - paddle.frame.width/2.0, y: 20)
        paddle.physicsBody = SKPhysicsBody.init(rectangleOf: paddle.frame.size,
                                                center: CGPoint(x: paddle.frame.width/2.0, y:paddle.frame.height/2.0 ))
        paddle.physicsBody?.restitution=1.0
        paddle.physicsBody?.friction=0.0
        paddle.physicsBody?.linearDamping=0.0
        paddle.physicsBody?.angularDamping=0.0
        paddle.physicsBody?.isDynamic = false
       
        
        let ball = SKShapeNode.init(circleOfRadius: 8.0)
        ball.name=kBallName
        ball.fillColor=SKColor.red
        ball.position=CGPoint(x: self.frame.width/2.0, y: self.frame.height/2.0)
        ball.physicsBody=SKPhysicsBody.init(circleOfRadius: 8.0)
        ball.physicsBody?.restitution=1.0
        ball.physicsBody?.friction=0.0
        ball.physicsBody?.linearDamping=0.0
        ball.physicsBody?.angularDamping=0.0
        ball.physicsBody?.affectedByGravity=false
        ball.physicsBody?.categoryBitMask = ballCategory
        ball.physicsBody?.contactTestBitMask = bottomCategory
        
        self.addChild(ball)
        
        ball.physicsBody?.applyImpulse(CGVector(dx:2.0, dy:2.0))
        
       
        self.addChild(paddle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isFingerOnThePaddle = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch?.location(in: self)
        if let bodyPaddle = physicsWorld.body(at: touchLocation!){
            if bodyPaddle.node?.name == kPaddleName{
                isFingerOnThePaddle=true
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isFingerOnThePaddle{
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previouseTouchLoaction = touch!.previousLocation(in: self)
            let paddle : SKShapeNode = childNode(withName: kPaddleName) as! SKShapeNode
            var paddleX = paddle.position.x + (touchLocation.x - previouseTouchLoaction.x)
            paddleX = max(paddleX, 0 )
            paddleX = min(paddleX, size.width - paddle.frame.size.width)
            paddle.position = CGPoint(x: paddleX, y: paddle.position.y)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFingerOnThePaddle=false
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print ("something colide")
    }
}
