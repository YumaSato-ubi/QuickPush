import SpriteKit
import GameplayKit

var i = 1

class TitleScene: SKScene {
    
    let Start = SKLabelNode(fontNamed: "Chalkboard SE")

    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        let QuickTap = SKLabelNode(fontNamed: "Chalkboard SE")
        QuickTap.text = "Quick Tap!"
        QuickTap.fontColor = .red
        QuickTap.fontSize = 110
        QuickTap.position = CGPoint(x: self.frame.midX, y:(self.frame.midY) + 150 )
        self.addChild(QuickTap)

        for i in 1...10 {
        let num = SKLabelNode(fontNamed: "Chalkboard SE")
        let angle:CGFloat = CGFloat(Int.random(in : 0...359))
            
        num.text = "\(i)"
        num.fontColor = .gray
        num.fontSize = CGFloat(Int.random(in : 100...500))
        num.position = CGPoint(x: Int.random(in: -100...600), y: Int.random(in: -200...800))
        num.zRotation = angle
        num.alpha = 0.2
        self.addChild(num)
        }
        
        Start.text = "Start"
        Start.fontColor = .black
        Start.fontSize = 100
        Start.position = CGPoint(x: self.frame.midX, y:(self.frame.midY) - 250 )
        self.addChild(Start)
    }
    
    func TenCircle() {
        for i in 1...10{
        let randomSize = Int.random(in : 50...90)
        let randomSizeDouble1 = Double.random(in : -250...250)
        let randomSizeDouble2 = Double.random(in : -500...500)
        let num = SKLabelNode(fontNamed: "Chalkduster")
        let circle = SKShapeNode(circleOfRadius: CGFloat(randomSize))
        circle.position = CGPoint(x: randomSizeDouble1, y: randomSizeDouble2)
        circle.fillColor = .systemPink
        num.position = CGPoint(x: randomSizeDouble1, y: randomSizeDouble2)
        num.text = "\(i)"
        
        self.addChild(circle)
        self.addChild(num)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        for obj in touches {
                let touch = obj
                let location = touch.location(in: self)
                let node = self.atPoint(location)
                if node == self.Start {
                    let secondScene = GameScene(size: self.size)
                    secondScene.scaleMode = SKSceneScaleMode.aspectFill
                    self.view?.presentScene(secondScene)
            }
        }

    }
    override func update(_ currentTime: CFTimeInterval){}

}
