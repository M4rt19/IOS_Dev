////
//  SecondViewController.swift
//  moviesTop
//
//  Created by Student on 01.11.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var text: UILabel!
    
    var inputModel: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = inputModel?.poster
        desc.text = inputModel?.title
        text.text = inputModel?.description
        // Do any additional setup after loading the view.
    }
    
    func configure(with model: Movie?){
        self.inputModel = model
        
    }

}
