import SpriteKit
import GameplayKit


class GameScene: SKScene {

    override func didMove(to view: SKView) {
        let countdownSound = SKAudioNode(fileNamed: "countdown.mp3")
        self.backgroundColor = .white
        let count = SKLabelNode(fontNamed: "Gill Sans")
        count.fontColor = .systemRed
        count.fontSize = 200
        count.position = CGPoint(x : self.frame.midX, y : self.frame.midY)
        self.addChild(count)

        let inter = SKAction.wait(forDuration: 1.0)
        let hidden = SKAction.run ({
            count.isHidden = true
        })
        let three = SKAction.run ({
            count.text = "3"
        })
        let two = SKAction.run ({
            count.text = "2"
        })
        let one = SKAction.run ({
            count.text = "1"
        })
        
        self.run(SKAction.sequence([three,inter,two,inter,one,inter,hidden]))
        self.addChild(countdownSound)
        _ = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.NextScene), userInfo: nil, repeats: false)
    }
  
    @objc func NextScene(){
        let thirdScene = GamePlayScene(size: self.size)
        thirdScene.scaleMode = SKSceneScaleMode.aspectFill
        self.view?.presentScene(thirdScene)
    }
    func touchMoved(toPoint pos : CGPoint) {
    }

    func touchUp(atPoint pos : CGPoint) {
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

}
