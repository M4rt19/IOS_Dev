//
//  SecondViewControllerBody.swift
//  moviesTop
//
//  Created by BMK on 13.11.2024.
//

import UIKit

class SecondViewControllerBody: UIViewController {
    
    @IBOutlet weak var imageBody: UIImageView!
    @IBOutlet weak var textBody: UILabel!
    @IBOutlet weak var descBody: UILabel!
    
    var inputModel: Body?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageBody.image = inputModel?.poster
        textBody.text = inputModel?.title
        descBody.text = inputModel?.description
        // Do any additional setup after loading the view.
    }
    
    func configureBody(with model: Body?) {
        self.inputModel = model
        
    }
    
    
    

}
