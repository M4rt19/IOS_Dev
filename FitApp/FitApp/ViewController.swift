//
//  ViewController.swift
//  FitApp
//
//  Created by BMK on 13.12.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func next(_ sender: UIButton){
        performSegue(withIdentifier: "cal", sender: nil)
    }
}

