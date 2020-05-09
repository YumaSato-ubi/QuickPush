import SpriteKit

class ScoreScene: SKScene {
        let BackTitle = SKLabelNode(fontNamed: "Chalkboard SE")
        let tryAgain = SKLabelNode(fontNamed: "Chalkboard SE")
        let Value = SKLabelNode(fontNamed: "Noteworthy")
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        
        let ScoreLabel = SKLabelNode(fontNamed: "Chalkboard SE")
        ScoreLabel.text = "Time"
        ScoreLabel.fontColor = .red
        ScoreLabel.fontSize = 60
        ScoreLabel.position = CGPoint(x: self.frame.midX, y:(self.frame.midY) + 100 )
        self.addChild(ScoreLabel)
        
        let FinishTime = (floor(timeTotal*100))/100
        let ScoreTime = SKLabelNode(fontNamed: "Chalkboard SE")
        ScoreTime.text = "\(FinishTime) s"
        ScoreTime.fontColor = .black
        ScoreTime.fontSize = 100
        ScoreTime.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(ScoreTime)
        
        if FinishTime < 2.0 {
            Value.text = "What's?!"
            Value.fontColor = .red
            Value.fontSize = 120
            Value.position = CGPoint(x: self.frame.midX, y:(self.frame.midY) + 320 )
            self.addChild(Value)
        } else if FinishTime < 3.0 {
            Value.text = "You are Crazy!!"
            Value.fontColor = .magenta
            Value.fontSize = 120
            Value.position = CGPoint(x: self.frame.midX, y:(self.frame.midY) + 320 )
            self.addChild(Value)
        } else if FinishTime < 4.0 {
            Value.text = "Very Well!"
            Value.fontColor = .orange
            Value.fontSize = 120
            Value.position = CGPoint(x: self.frame.midX, y:(self.frame.midY) + 320 )
            self.addChild(Value)
        } else if FinishTime < 5.0 {
            Value.text = "Good."
            Value.fontColor = .systemPink
            Value.fontSize = 120
            Value.position = CGPoint(x: self.frame.midX, y:(self.frame.midY) + 320 )
            self.addChild(Value)
        } else if FinishTime < 7.0 {
            Value.text = "So so ..."
            Value.fontColor = .blue
            Value.fontSize = 120
            Value.position = CGPoint(x: self.frame.midX, y:(self.frame.midY) + 320 )
            self.addChild(Value)
        } else if FinishTime < 9.0 {
            Value.text = "Oh no ..."
            Value.fontColor = .lightGray
            Value.fontSize = 120
            Value.position = CGPoint(x: self.frame.midX, y:(self.frame.midY) + 320 )
            self.addChild(Value)
        } else {
            Value.text = "You're monkey."
            Value.fontColor = .darkGray
            Value.fontSize = 120
            Value.position = CGPoint(x: self.frame.midX, y:(self.frame.midY) + 320 )
            self.addChild(Value)
        }
        
        BackTitle.text = "Back to Title"
        BackTitle.fontColor = .green
        BackTitle.fontSize = 80
        BackTitle.position = CGPoint(x: (self.frame.midX) , y: (self.frame.midY) - 450 )
        self.addChild(BackTitle)
        
        tryAgain.text = "Retry"
        tryAgain.fontColor = .green
        tryAgain.fontSize = 80
        tryAgain.position = CGPoint(x: (self.frame.midX) , y: (self.frame.midY) - 300 )
        self.addChild(tryAgain)
    }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
            for obj in touches {
                    let touch = obj
                    let location = touch.location(in: self)
                    let node = self.atPoint(location)
                    if node == self.BackTitle {
                        timeTotal = 0
                        Value.removeFromParent()
                        let repeatScene = TitleScene(size: self.size)
                        repeatScene.scaleMode = SKSceneScaleMode.aspectFill
                        self.view?.presentScene(repeatScene)
                    } else if node == self.tryAgain {
                        timeTotal = 0
                        Value.removeFromParent()
                        let repeatScene = GameScene(size: self.size)
                        repeatScene.scaleMode = SKSceneScaleMode.aspectFill
                        self.view?.presentScene(repeatScene)
                }
            }

        }
}
