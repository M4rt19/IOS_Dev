//
//  StartViewController.swift
//  FitApp
//
//  Created by BMK on 27.12.2024.
//

import UIKit
import Kingfisher


class StartViewController: UIViewController {
    @IBAction func Gifs(_ sender: UIButton){
        performSegue(withIdentifier: "GifMus", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}
