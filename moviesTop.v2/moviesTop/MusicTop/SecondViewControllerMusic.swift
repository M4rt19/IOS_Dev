//
//  SecondViewControllerMusic.swift
//  moviesTop
//
//  Created by BMK on 12.11.2024.
//

import UIKit

class SecondViewControllerMusic: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var text: UILabel!
    
    var inputModel: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = inputModel?.poster
        desc.text = inputModel?.title
        text.text = inputModel?.description
        // Do any additional setup after loading the view.
    }
    
    func configureMusic(with model: Song?){
        self.inputModel = model
        
    }
}
