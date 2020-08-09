//
//  ContentView.swift
//  SkseenDemo
//
//  Created by kn on 8/9/20.
//  Copyright © 2020 kn. All rights reserved.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 300, height: 400)
    }
}

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        
        let colors = [SKColor.green, SKColor.magenta, SKColor.cyan]
        let randomColor = colors.randomElement() ?? SKColor.green
        
        let circle = SKShapeNode(circleOfRadius: 5)
        circle.position = location
        circle.strokeColor = SKColor.black
        circle.fillColor = randomColor
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 5)
        addChild(circle)
    }
}
