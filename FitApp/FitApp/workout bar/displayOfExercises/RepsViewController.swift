//
//  RepsViewController.swift
//  FitApp
//
//  Created by BMK on 23.12.2024.
//

import UIKit

protocol passData{
    func changeRow(reps: String, weight: String)
    func deleteRow()
}


class RepsViewController: UIViewController, UITextFieldDelegate {
    
    var delegate:passData?
    var dataPassReps:String?
    var dataPassWeight:String?
    var placeholderLabel: UILabel!
    var placeholderLabel2: UILabel!
    
    @IBOutlet weak var textRep: UITextField!
    @IBOutlet weak var textWeight: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        textRep.delegate = self
               textWeight.delegate = self
               
               // Configure placeholder for textRep
               placeholderLabel = UILabel()
               placeholderLabel.text = dataPassReps ?? "Enter reps"
               placeholderLabel.font = textRep.font
               placeholderLabel.textColor = .lightGray
               placeholderLabel.isHidden = !textRep.text!.isEmpty
               
               placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
               textRep.addSubview(placeholderLabel)
               
               NSLayoutConstraint.activate([
                   placeholderLabel.leadingAnchor.constraint(equalTo: textRep.leadingAnchor, constant: 5),
                   placeholderLabel.topAnchor.constraint(equalTo: textRep.topAnchor, constant: 8)
               ])
               
               // Configure placeholder for textWeight
               placeholderLabel2 = UILabel()
               placeholderLabel2.text = dataPassWeight ?? "Enter weight"
               placeholderLabel2.font = textWeight.font
               placeholderLabel2.textColor = .lightGray
               placeholderLabel2.isHidden = !textWeight.text!.isEmpty
               
               placeholderLabel2.translatesAutoresizingMaskIntoConstraints = false
               textWeight.addSubview(placeholderLabel2)
               
               NSLayoutConstraint.activate([
                   placeholderLabel2.leadingAnchor.constraint(equalTo: textWeight.leadingAnchor, constant: 5),
                   placeholderLabel2.topAnchor.constraint(equalTo: textWeight.topAnchor, constant: 8)
               ])
               
               // Observe text changes
               textRep.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
               textWeight.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
           }
           
           // Toggle placeholder visibility when text changes
           @objc func textFieldDidChange(_ textField: UITextField) {
               if textField == textRep {
                   placeholderLabel.isHidden = !textField.text!.isEmpty
               } else if textField == textWeight {
                   placeholderLabel2.isHidden = !textField.text!.isEmpty
               }
           }
           
           func textFieldDidBeginEditing(_ textField: UITextField) {
               if textField == textRep {
                   placeholderLabel.isHidden = true
               } else if textField == textWeight {
                   placeholderLabel2.isHidden = true
               }
           }
           
           func textFieldDidEndEditing(_ textField: UITextField) {
               if textField == textRep {
                   placeholderLabel.isHidden = !textField.text!.isEmpty
               } else if textField == textWeight {
                   placeholderLabel2.isHidden = !textField.text!.isEmpty
               }
           }
        // Do any additional setup after loading the view.
    
    
    
    
    
    @IBAction func saveButton(_ sender: UIButton) {
    
        let repTo = textRep.text!
        let weightTo = textWeight.text!
        
        delegate?.changeRow(reps: repTo, weight: weightTo)
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
    
    @IBAction func deleteSet(_ sender: UIButton) {
        delegate?.deleteRow()
        navigationController?.popViewController(animated: true)
    }

}
