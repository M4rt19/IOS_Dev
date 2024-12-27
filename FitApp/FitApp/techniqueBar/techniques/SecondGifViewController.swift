//
//  SecondGifViewController.swift
//  FitApp
//
//  Created by BMK on 27.12.2024.
//

import UIKit

class SecondGifViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var gifLabel: UILabel!
    
    var inputModel: GifExercise?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let model = inputModel {
            gifImageView.loadGif(name: model.gif) // Load the GIF using a method (you need to implement this or use a library)
            gifLabel.text = model.label
        }
    }
    
    func configure(with model: GifExercise){
        self.inputModel = model
        
    }
    

   

}
