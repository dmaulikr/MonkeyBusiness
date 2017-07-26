//
//  monkey.swift
//  Jump
//
//  Created by Andrew Tsukuda on 7/5/17.
//  Copyright © 2017 Andrew Tsukuda. All rights reserved.
//

import SpriteKit

enum characterOrientationState {
    case bottom, right, top, left
}

enum characterState {
    case normal, superSaiyajin
}

class Player: SKSpriteNode {
    var x = CGFloat(0)
    
    var orientation: characterOrientationState = .bottom
    var state: characterState = .normal
    
    /* You are required to implement this for your subclass to work */
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    /* You are require to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func death() {
        //self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.physicsBody?.pinned = true
        self.removeAllActions()
        
        let turnRed = SKAction.colorize(with: UIColor.red, colorBlendFactor: 1.0, duration: 0.50)
        let removePlayer = SKAction.removeFromParent()
        let seq = SKAction.sequence([turnRed, removePlayer])
        self.run(seq)
    }
    
    func powerUp() {
        let color = SKAction.colorize(with: UIColor.magenta , colorBlendFactor: 1.0, duration: 8)
        let uncolor = color.reversed()
        uncolor.duration = 1
        let seq = SKAction.sequence([color, uncolor])
        self.run(seq)
    }

}
