//
//  ViewController.swift
//  BullsEye
//
//  Created by Zheng Wan Zhang on 2019/2/17.
//  Copyright © 2019 Zheng Wan Zhang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    

    
    @IBOutlet weak var slider:UISlider! //将slider 变为全局范围
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    var audioPlayer: AVAudioPlayer!


    var currentValue: Int = 50
    var targetValue: Int = 0
    var score = 0
    var round = 0


    // 变量
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    //Label 信息显示
    
    func startNewRound() {
        
        targetValue =  1 + Int (arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        round += 1
    }
    
    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }

    @IBAction func startOver(){
        
        startNewGame()
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGame()
        // 设置滑动条背景及颜色
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for:  .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets);slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets);slider.setMaximumTrackImage(trackRightResizable, for: .normal)

        playBgMusic()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  
    
    
    @IBAction func showAlert(){
        
        var difference = currentValue - targetValue
        if(difference<0){
            difference = difference * -1
        }
        
        let points = 100 - difference
        score += points

        let title: String
        if difference == 0{
            title = "运气逆天！赶紧去买注彩票吧！"
            
        }else if difference < 5 {
            title = "太棒了！差一点就到了！"
            
        }else if difference < 10 {
            title = "很不错！继续努力！"
        }else {
            title = "差太远了，君在长江头，我在长江尾~"
        }

        let message = "您的得分是： \(points)分"

        let alert = UIAlertController (title:title,message:message,preferredStyle: .alert)
        let action = UIAlertAction(title:"继续",style: .default,handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
       
        startNewRound()

    }
    
    @IBAction func sliderMoved(slider: UISlider){
        
        // print("滑动条的当前数值是： \(slider.value)")
        
        currentValue = lroundf(slider.value)
        
    }

    // play background music
    
    func playBgMusic(){
        let musicPath = Bundle.main.path(forResource: "bgmusic", ofType: "mp3")
        let url = URL.init(fileURLWithPath: musicPath!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        }catch _ {
            audioPlayer = nil
        }
        
        audioPlayer.numberOfLoops = -1
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }

    
}

