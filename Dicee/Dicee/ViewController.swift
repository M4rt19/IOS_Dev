//
//  ViewController.swift
//  Dicee
//
//  Created by BMK on 09.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let diceImages = ["1", "2", "3", "4", "5", "6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView1.image = UIImage(named: diceImages.randomElement()!)
        imageView2.image = UIImage(named: diceImages.randomElement()!)
        
    }
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBAction func rollDice(_ sender: UIButton) {
        imageView1.image = UIImage(named: diceImages.randomElement()!)
        imageView2.image = UIImage(named: diceImages.randomElement()!)
    }
    
    
}

