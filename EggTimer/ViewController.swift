//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    let softEgg = 5
//    let mediumEgg = 8
//    let hardEgg = 12
    
    @IBOutlet weak var txtHeading: UILabel!
    @IBOutlet weak var eggProgressBar: UIProgressView!
    
    var player: AVAudioPlayer?
    let eggTimer = ["Soft":300, "Medium":480, "Hard":720]
    var timer = Timer()
    
    var totalTime = 0
    var secondsPass = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        eggProgressBar.progress = 0.0
        secondsPass  = 0

        let hardness = sender.currentTitle!
        txtHeading.text = hardness
        
        totalTime = eggTimer[hardness]!
        
        //------------- Print Hardness using the If Else
//        if(hardness=="Soft"){
//            print("Soft button was pressed")
//        }
//        else if(hardness=="Medium"){
//            print("Medium button was pressed")
//        }
//        else if(hardness=="Hard"){
//            print("Hard button was pressed")
//        }
        
        
 //------------- Print Hardness using the Switch
//        switch hardness{
//        case "Soft":
//            print("Soft button was pressed with timer", eggTimer[hardness!]!, "min")
//        case "Medium":
//            print("Medium button was pressed with timer", eggTimer[hardness!]!, "min")
//        case "Hard":
//            print("Hard button was pressed with timer", eggTimer[hardness!]!, "min")
//        default:
//            print("Unknown error")
//        }
        
        
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true    )
        
    }
    
    // adding objc as timers come from Objective C
    @objc func updateTimer(){
        if secondsPass < totalTime {
            print("\(secondsPass) seconds.")
           // let percentageProgress = secondsPass/totalTime
            secondsPass += 1
            eggProgressBar.progress = Float(secondsPass) / Float(totalTime)
        }
        else{
            timer.invalidate()
            txtHeading.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player?.play()
        }
            
        
    }
    

}
