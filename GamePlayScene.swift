import SpriteKit
import GameplayKit
import AVFoundation

    
    var timeTotal: Double = 0
    var timer1: Timer?
    let StartSound = SKAudioNode(fileNamed: "pi.mp4")

class GamePlayScene: SKScene {
    var timer: Timer?
    
    var array1:Set = [100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600]
    var array2:Set = [100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000]

    var TrueInstanse: AVAudioPlayer! = nil
    var FalseInstanse: AVAudioPlayer! = nil

    @objc func handleTimer(_ timer: Timer) {
        timeTotal += timer.timeInterval
        print("timer fired. total : \(timeTotal)")
    }
    @objc func StopStart() {
        let stopAction = SKAction.stop()
        StartSound.run(stopAction)
    }
    

 override func didMove(to view: SKView) {
    timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
        let TrueSoundPath = Bundle.main.path(forResource: "true", ofType: "mp3")!
        let FalseSoundPath = Bundle.main.path(forResource: "false", ofType: "mp3")!
        let TrueSound = URL(fileURLWithPath: TrueSoundPath)
        let FalseSound = URL(fileURLWithPath: FalseSoundPath)
    do {
        TrueInstanse = try AVAudioPlayer(contentsOf: TrueSound, fileTypeHint: nil)
    } catch {
        print("TrueSound is error.")
    }
    do {
        FalseInstanse = try AVAudioPlayer(contentsOf: FalseSound, fileTypeHint: nil)
    } catch {
        print("FalseSound is error.")
    }
    TrueInstanse.prepareToPlay()
    FalseInstanse.prepareToPlay()
    
        self.addChild(StartSound)
        self.backgroundColor = .white
    timer1 = Timer.scheduledTimer(timeInterval: 1.8, target: self, selector: #selector(self.StopStart), userInfo: nil, repeats: false)
        
        for i in 0...9{
        let randomSize = Int.random(in : 100...300)
        let randomSizeDouble1 = array1.randomElement()
        let randomSizeDouble2 = array2.randomElement()
        array1.remove(randomSizeDouble1!)
        array2.remove(randomSizeDouble2!)
        let num = SKLabelNode(fontNamed: "Chalkboard SE")
        num.position = CGPoint(x: randomSizeDouble1!, y: randomSizeDouble2!)
        num.fontSize = CGFloat(randomSize)
        num.text = "\(10 - i)"
            
        switch(Int.random(in : 0...9)) {
        case 0:
            num.fontColor = .systemPink
        case 1:
            num.fontColor = .systemYellow
        case 2:
            num.fontColor = .systemGreen
        case 3:
            num.fontColor = .systemBlue
        case 4:
            num.fontColor = .systemGray
        case 5:
            num.fontColor = .systemTeal
        case 6:
            num.fontColor = .systemIndigo
        case 7:
            num.fontColor = .systemPurple
        case 8:
            num.fontColor = .systemRed
        default:
            num.fontColor = .systemOrange
        }
            
        self.addChild(num)
        }
    }
    
    var TenArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 888]
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for obj in touches {
                let touch = obj
                let location = touch.location(in: self)
                let node = self.atPoint(location)
            if let label = node as? SKLabelNode {
                if label.text == "\(TenArray.min()!)"{
                    TrueInstanse.currentTime = 0
                    TrueInstanse.play()
                    label.removeFromParent()
                    TenArray.removeFirst()
                    if TenArray[0] == 888 {
                        timer!.invalidate()
                        let scoreScene = ScoreScene(size: self.size)
                        scoreScene.scaleMode = SKSceneScaleMode.aspectFill
                        self.view?.presentScene(scoreScene)
                        
                    }
                } else if label.text != "\(TenArray.min()!)"{
                    FalseInstanse.currentTime = 0
                    FalseInstanse.play()
                } else {
                    continue
                }
                
            }
        
        }

    }

    func touchMoved(toPoint pos : CGPoint) {
    }

    func touchUp(atPoint pos : CGPoint) {
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

}



