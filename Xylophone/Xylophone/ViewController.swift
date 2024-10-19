//
//  ViewController.swift
//  Xylophone
//
//  Created by BMK on 18.10.2024.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audio: AVAudioPlayer!
    var soundArray = ["0","1","2","3","4","5","6"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let selectedSound = soundArray[sender.tag]
        choosedSound(choosedSound: selectedSound)
    }
    
    func choosedSound(choosedSound: String){
        let soundUrl = Bundle.main.url(forResource: choosedSound, withExtension: ".wav")
        
        do{
            try audio = AVAudioPlayer(contentsOf: soundUrl!)
            audio.prepareToPlay()
            audio.play()
        }
        catch{
            print("Error")
        }
    }
    
}

 
