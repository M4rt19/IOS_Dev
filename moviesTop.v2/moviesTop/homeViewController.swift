//
//  homeViewController.swift
//  moviesTop
//
//

import UIKit

class homeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        enterText.text = "Which collection do you want to see?"
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var enterText: UILabel!
    
    
    @IBAction func movieBut(_ sender: UIButton) {
    }
    @IBAction func musicBut(_ sender: UIButton) {
    }
    @IBAction func bodyBut(_ sender: UIButton) {
    }
}
