//
//  RepsViewController.swift
//  FitApp
//
//  Created by BMK on 23.12.2024.
//

import UIKit

protocol passData{
    func changeRow(reps: String, weight: String)
}


class RepsViewController: UIViewController {
    
    var delegate:passData?
    
    @IBOutlet weak var textRep: UITextField!
    @IBOutlet weak var textWeight: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        textRep.text = dataPass
        // Do any additional setup after loading the view.
    }
    
    var dataPass:String?
    
    
    @IBAction func saveButton(_ sender: UIButton) {
    
        let repTo = textRep.text!
        let weightTo = textWeight.text!
        
        delegate?.changeRow(reps: repTo, weight: weightTo)
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
    
    @IBAction func deleteSet(_ sender: UIButton) {
        
    }

}
