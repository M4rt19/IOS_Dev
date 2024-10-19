//
//  ViewController.swift
//  Egg Timer
//
//  Created by BMK on 19.10.2024.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    // Timer-related properties
    var timer: Timer?
    var totalTime = 0
    var secondsPassed = 0
        
    // Alarm sound player
    var player: AVAudioPlayer?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.0
        timeLabel.text = ""
    }
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let eggType = sender.tag// "1-Soft", "2-Medium", or "3-Hard"
                
                // Stop and reset if a timer is already running
                timer?.invalidate()
                progressView.progress = 0.0
                secondsPassed = 0
                
                // Set cooking duration based on the selected egg type
                switch eggType {
                case 1:
                    totalTime = 5 // 5 minutes
                case 2:
                    totalTime = 10 // 7 minutes
                case 3:
                    totalTime = 15 // 12 minutes
                default:
                    totalTime = 0
                }
                
                // Change the title to indicate that the timer has started
                titleLabel.text = "Cooking your egg..."
                
                startTimer()
        }
    func startTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }

        @objc func updateTimer() {
            if secondsPassed < totalTime {
                secondsPassed += 1
                
                // Update the progress bar
                let progress = Float(secondsPassed) / Float(totalTime)
                progressView.progress = progress
                
                // Update the time label
                let minutesLeft = (totalTime - secondsPassed) / 60
                let secondsLeft = (totalTime - secondsPassed) % 60
                timeLabel.text = String(format: "%02d:%02d", minutesLeft, secondsLeft)
                
            } else {
                // Timer finished
                timer?.invalidate()
                timeLabel.text = "Done!"
                playAlarmSound()
                
                // Change the title to indicate that the eggs are ready
                titleLabel.text = "Eggs are ready!"
            }
        }

        func playAlarmSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            
            player = try? AVAudioPlayer(contentsOf: url!)
            player?.play()
        }
}

